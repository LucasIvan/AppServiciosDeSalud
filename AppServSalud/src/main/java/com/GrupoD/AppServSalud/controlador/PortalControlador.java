
package com.GrupoD.AppServSalud.controlador;

import com.GrupoD.AppServSalud.dominio.entidades.Paciente;
import com.GrupoD.AppServSalud.dominio.entidades.Profesional;
import com.GrupoD.AppServSalud.dominio.entidades.Usuario;
import com.GrupoD.AppServSalud.dominio.repositorio.ProfesionalRepositorio;
import com.GrupoD.AppServSalud.dominio.servicios.OfertaServicio;
import com.GrupoD.AppServSalud.dominio.servicios.UsuarioServicio;
import com.GrupoD.AppServSalud.utilidades.EspecialidadEnum;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping("/")
public class PortalControlador {
    @Autowired
    private ProfesionalRepositorio profesionalRepositorio;

    @Autowired
    private OfertaServicio ofertaServicio;

    @Autowired
    private UsuarioServicio usuarioServicio;

    @GetMapping("/")
    public String index(ModelMap modelo) {
        try {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
            Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
            modelo.put("usuario", usuario);
            return "index.html";
        } catch (Exception e) {
            modelo.put("usuario", null);
            return "index.html";
        }

    }

    @GetMapping("/login")
    public String login(ModelMap modelo) {
        modelo.put("usuario", null);
        return "login.html";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MEDICO') or hasRole('ROLE_PACIENTE')")
    @GetMapping("/perfil")
    public String perfil(ModelMap modelo) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
        modelo.put("usuario", usuario);
        return "vistaPerfil.html";
    }

    @GetMapping("/error_403")
    public String error403(ModelMap modelo) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
        modelo.put("usuario", usuario);
        return "error_403.html";
    }

    @GetMapping("/error_404")
    public String error404(ModelMap modelo) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
        modelo.put("usuario", usuario);
        return "error_404.html";
    }

    @GetMapping("/infoTurnos")
    public String infoTurno(ModelMap modelo) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
        modelo.put("usuario", usuario);
        return "infoTurnos.html";
    }

    @GetMapping("/especialidades")
    public String especialidades(@RequestParam(required = false) String error,
            @RequestParam(required = false) String exito, ModelMap modelo) {
        try {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
            Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
            if (error != null) {
                modelo.addAttribute("error", error);
            }
            if (exito != null) {
                modelo.addAttribute("exito", exito);
            }
            modelo.put("usuario", usuario);
            return "especialidades.html";
        } catch (Exception e) {
            if (error != null) {
                modelo.addAttribute("error", error);
            }
            if (exito != null) {
                modelo.addAttribute("exito", exito);
            }
            modelo.put("usuario", null);
            return "especialidades.html";
        }

    }

    @GetMapping("/tarjetaProfesional/{especialidad}")
    public String tarjetaProfesional(@PathVariable String especialidad, ModelMap modelo) {
        try {
            UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
                    .getPrincipal();
            Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
            String espProf = especialidad.toUpperCase();
            List<Profesional> profesionales = profesionalRepositorio
                    .buscarPorEspecialidad(EspecialidadEnum.valueOf(espProf));
            modelo.addAttribute("profesionales", profesionales);
            modelo.addAttribute("ofertas", ofertaServicio.listarOferta());
            modelo.put("usuario", usuario);
            return "tarjetaProfesional.html";
        } catch (Exception e) {
            String espProf = especialidad.toUpperCase();
            List<Profesional> profesionales = profesionalRepositorio
                    .buscarPorEspecialidad(EspecialidadEnum.valueOf(espProf));
            modelo.addAttribute("profesionales", profesionales);
            modelo.addAttribute("ofertas", ofertaServicio.listarOferta());
            modelo.put("usuario", null);
            return "tarjetaProfesional.html";
        }
    }

    @PreAuthorize("hasRole('ROLE_PACIENTE')")
    @GetMapping("/tarjetaProfesional/oferta")
    public String turno(ModelMap modelo, HttpSession session) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Usuario usuario = usuarioServicio.getUsuario(userDetails.getUsername());
        session.getAttribute("usuario");
        modelo.put("usuario", usuario);
        return "turnoPaciente.html";
    }

}
