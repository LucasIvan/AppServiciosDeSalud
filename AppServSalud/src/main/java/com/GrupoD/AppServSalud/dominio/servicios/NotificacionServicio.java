package com.GrupoD.AppServSalud.dominio.servicios;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.GrupoD.AppServSalud.dominio.entidades.Notificacion;
import com.GrupoD.AppServSalud.dominio.entidades.Usuario;
import com.GrupoD.AppServSalud.dominio.repositorio.UsuarioRepositorio;
import com.GrupoD.AppServSalud.excepciones.MiExcepcion;

@Service
public class NotificacionServicio {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @Transactional
    private void crearNotificacionPedidoTurno(String idUsuario, String idReceptor) throws MiExcepcion {

        Optional<Usuario> emisorOptional = usuarioRepositorio.findById(idUsuario);
        Optional<Usuario> receptorOptional = usuarioRepositorio.findById(idReceptor);
        if (!emisorOptional.isPresent()) {
            throw new MiExcepcion("El usuario Emisor no existe");
        }
        if (!receptorOptional.isPresent()) {
            throw new MiExcepcion("El usuario Receptor no existe");
        }
        Usuario emisor = emisorOptional.get();
        Usuario receptor = receptorOptional.get();
        Notificacion notificacion = new Notificacion();

        notificacion.setFechaEmision(new Date());
        notificacion.setLeido(false);
        notificacion.setMensaje(
                "El usuario " + emisor.getNombre() + " " + emisor.getApellido() + " DNI: " + emisor.getDni()
                        + " ha solicitado un turno con usted. Para aceptar o rechazar " +
                        "el turno, ingrese a la sección de turnos.");
        notificacion.setResumen("Solicitud de turno");
        notificacion.setRemitente(receptor.getId());

        receptor.getNotificaciones().add(notificacion);
        usuarioRepositorio.save(receptor);
    }

    @Transactional
    private void crearNotificacionEstadoTurno(String idUsuario, String idReceptor, boolean aceptado) throws MiExcepcion{
        Optional<Usuario> emisorOptional = usuarioRepositorio.findById(idUsuario);
        Optional<Usuario> receptorOptional = usuarioRepositorio.findById(idReceptor);
        if (!emisorOptional.isPresent()) {
            throw new MiExcepcion("El usuario Emisor no existe");
        }
        if (!receptorOptional.isPresent()) {
            throw new MiExcepcion("El usuario Receptor no existe");
        }
        Usuario emisor = emisorOptional.get();
        Usuario receptor = receptorOptional.get();
        Notificacion notificacion = new Notificacion();

        notificacion.setFechaEmision(new Date());
        notificacion.setLeido(false);
        notificacion.setMensaje(
                "El usuario " + emisor.getNombre() + " " + emisor.getApellido() + " DNI: " + emisor.getDni()
                        + " ha " + (aceptado ? "aceptado" : "rechazado") + " su solicitud de turno.");
        notificacion.setResumen("Solicitud de turno");
        notificacion.setRemitente(receptor.getId());

        receptor.getNotificaciones().add(notificacion);
        usuarioRepositorio.save(receptor);
    }

    public List<Notificacion> obtenerNotificaciones(String idUsuario) throws MiExcepcion {
        Optional<Usuario> usuarioOptional = usuarioRepositorio.findById(idUsuario);
        if (!usuarioOptional.isPresent()) {
            throw new MiExcepcion("El usuario no existe");
        }
        Usuario usuario = usuarioOptional.get();
        return usuario.getNotificaciones();
    }

    public List<Notificacion> obtenerNotificacionesLeidasONoLeidas(String idUsuario, boolean leido){
        Usuario usuario = usuarioRepositorio.findById(idUsuario).get();
        return usuario.getNotificaciones().stream()
            .filter(n -> 
                n.isLeido() == leido
            ).collect(Collectors.toList());
    }

}
