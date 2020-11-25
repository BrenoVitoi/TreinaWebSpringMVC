package br.com.treinaweb.springmvc.security;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import br.com.treinaweb.springmvc.dominios.Usuario;
import br.com.treinaweb.springmvc.repositorios.RepositorioUsuario;

public class TreinaWebUserDetailsService implements UserDetailsService{
	
	@Autowired
	private RepositorioUsuario repositorio;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//pesquisa o usuário por username
		Usuario usuario = repositorio.findByUsername(username);

		//lança excessão se não encontrar usuário
		if(usuario == null) {
			throw new UsernameNotFoundException("Usuário não encontrado");
		}

		//cria e seta um Set de perfis do usuário
		Set<GrantedAuthority> perfis = new HashSet<GrantedAuthority>();
		perfis.add(new SimpleGrantedAuthority(usuario.getRole()));

		//retorna o usuário pronto para o SpringSecurity
		return new User(usuario.getUsername(), usuario.getPassword(), perfis);
	}

}
