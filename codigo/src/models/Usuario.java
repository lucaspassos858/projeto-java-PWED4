package models;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DBQuery;

public class Usuario {

	private int	idUsuario;
	private int	idNivelUsuario;
	private String	nome;
	private String	email;
	private String	senha;
	private String	token;

	private String tableName  = "usuario";
	private String fieldsName = "idUsuario, idNivelUsuario, nome, email, senha, token";
	private String fieldKey   = "idUsuario";

	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	 
	public Usuario() {}

	public Usuario(int idUsuario, int idNivelUsuario, String nome, String email, String senha, String token) {
		this.setIdUsuario(idUsuario);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setEmail(email);
		this.setSenha(senha);
		this.setToken(token);
	}

	private String[] toArray() {
		String[] data = new String[] {
		 Integer.toString(this.getIdUsuario()),
		 Integer.toString(this.getIdNivelUsuario()),
		 this.getNome(),
		 this.getEmail(),
		 this.getSenha(),
		 this.getToken(),
		};
		return(data);
	}
	

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}

	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getToken() {
		return senha;
	}

	public void setToken(String token) {
		this.token = token;
	}


	public boolean save() {
		if ( this.getIdUsuario() > 0 ) {
			this.dbQuery.update( this.toArray() );
		} else {
			this.dbQuery.insert( this.toArray() );
		}
		return true;
	}
	
	public void deleteById(int idUsuario) {
		this.dbQuery.deleteById(idUsuario);
	}

	public String listarUsuarios() {
		ResultSet rs =  this.dbQuery.select("");
		String saida = "";
		
		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>"+rs.getString("idUsuario") + "</td>";
				saida += "<td>"+rs.getString("nome") + "</td>";				
				saida += "<td>"+rs.getString("email") + "</td>";
				saida += "<td>"+rs.getString("idNivelUsuario") + "</td>";
				saida += "<td>"
						+ "<a href='editarUsuario.jsp?"
						+ "idUsuario=" + rs.getString("idUsuario")
						+ "&nome=" + rs.getString("nome")
						+ "&email=" + rs.getString("email")
						+ "&senha=" + rs.getString("senha")
						+ "&idNivelUsuario=" + rs.getString("idNivelUsuario")
						+ "' style='padding-right:5px;'>" 
						+ "<button type='submit' class='btn btn-success'>Editar</button>"
						+ "<a href='deletarUsuario.jsp?idUsuario=" + rs.getString("idUsuario") + "'>" 
						+ "<button type='submit' class='btn btn-danger'>Deletar</button>"
						+ "</td>";
				saida += "</tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public int BuscarIdUsuarioToken() {
		int saida = 0;
		ResultSet rs =  this.dbQuery.select("token ='" + this.token + "'");
		try {
		   while (rs.next()) {
	         saida += rs.getInt("idUsuario");
	       }
	    } catch (SQLException e) {
		  e.printStackTrace();
	    }
		  
		return saida;
	}
	
	public String BuscarIdNivelUsuario(String email) {
		String saida = "";
		ResultSet rs =  this.dbQuery.select("email ='" + email + "'");
		try {
		   while (rs.next()) {
	         saida += rs.getString("idNivelUsuario");
	       }
	    } catch (SQLException e) {
		  e.printStackTrace();
	    }
		  
		return saida;
	}
	
	public String BuscarNome(String email) {
		String saida = "";
		ResultSet rs =  this.dbQuery.select("email ='" + email + "'");
		try {
		   while (rs.next()) {
	         saida += rs.getString("nome");
	       }
	    } catch (SQLException e) {
		  e.printStackTrace();
	    }
		  
		return saida;
	}
	
	public Boolean verificarEmail(String email) {
		Boolean saida = true;
		ResultSet rs =  this.dbQuery.select("email ='" + email + "'");
		try {
		   if (rs.next() == false) {
	         saida = false;
	       }
	    } catch (SQLException e) {
		  e.printStackTrace();
	    }
		  
		return saida;
	}
	
	
	
	public Boolean login(String login, String senha){
		Boolean saida = false;
		
		ResultSet rs = this.dbQuery.select("email ='" + email + "' AND senha = '" + senha + "'");
		try {
			if(rs.next() == true) {
				saida = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return saida;
	}
	
	public boolean updateToken(String email, String token) {
		this.dbQuery.updateToken(email, token);
		return true;
	}
	
	public boolean updateSenha(int idUsuario, String senha) {
		this.dbQuery.updateSenha(idUsuario, senha);
		return true;
	}
}