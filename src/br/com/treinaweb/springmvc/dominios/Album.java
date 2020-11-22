package br.com.treinaweb.springmvc.dominios;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Album {
	
	@NotNull(message = "O nome é obrigatório")
	@NotEmpty(message = "O nome é obrigatório")
	@Size(min = 4, max = 10, message = "O nome do álbum deve conter entre 4 e 10 caracteres")
	
	private String nome;
	
	@NotNull(message = "O ano de lançamento é obrigatório")
	@Min(value = 1990, message = "O ano de lançamento deve ser a partir de 1990")
	@Max(value = 2030, message = "O ano de lançamento dever ser até 2030")
	private int anoDeLancamento;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getAnoDeLancamento() {
		return anoDeLancamento;
	}

	public void setAnoDeLancamento(int anoDeLancamento) {
		this.anoDeLancamento = anoDeLancamento;
	}

}
