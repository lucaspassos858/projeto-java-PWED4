package models;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DBQuery;

public class Post {
	
	private int	idPost;
	private String	titulo;
	private String	img;
	private String	descricao;
	private String	dataPublicacao;
	private String	autor;
	private int	idCategoria;

	
	private String tableName  = "post";
	private String fieldsName = "idPost, titulo, img, descricao, dataPublicacao, autor, idCategoria";
	private String fieldKey   = "idPost";

	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	 
	public Post() {}
	
	public Post(int idPost, String titulo, String img, String descricao, String dataPublicacao, String autor, int idCategoria) {
		this.setIdPost(idPost);
		this.setTitulo(titulo);
		this.setImg(img);
		this.setDescricao(descricao);
		this.setDataPublicacao(dataPublicacao);
		this.setAutor(autor);
		this.setIdCategoria(idCategoria);
	}
	
	private String[] toArray() {
		String[] data = new String[] {
		 Integer.toString(this.getIdPost()),
		 this.getTitulo(),
		 this.getImg(),
		 this.getDescricao(),
		 this.getDataPublicacao(),
		 this.getAutor(),
		 Integer.toString(this.getIdCategoria()),
		};
		return(data);
	}
	

	public int getIdPost() {
		return idPost;
	}

	public void setIdPost(int idPost) {
		this.idPost = idPost;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDataPublicacao() {
		return dataPublicacao;
	}

	public void setDataPublicacao(String dataPublicacao) {
		this.dataPublicacao = dataPublicacao;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	
	public boolean save() {
		if ( this.getIdPost() > 0 ) {
			this.dbQuery.update( this.toArray() );
		} else {
			this.dbQuery.insert( this.toArray() );
		}
		return true;
	}
	
	public String listarPosts() {
		ResultSet rs =  this.dbQuery.select("");
		String saida = "";
		
		try {
			while (rs.next()) {
				saida += "<tr>";
				saida += "<td>"+rs.getString("idPost") + "</td>";
				saida += "<td>"+rs.getString("titulo") + "</td>";				
				saida += "<td> <img src='"+rs.getString("img") + "' width='150'></td>";
				saida += "<td>"+rs.getString("descricao") + "</td>";
				saida += "<td>"+rs.getString("dataPublicacao") + "</td>";
				saida += "<td>"+rs.getString("autor") + "</td>";
				int idCategoria = Integer.parseInt(rs.getString("idCategoria"));
				String categoria = idCategoria == 1 ? "Filme" : "Série";
				saida += "<td>"+ categoria + "</td>";
				saida += "<td>"
						+ "<a href='editarPost.jsp?"
						+ "idPost=" + rs.getString("idPost")
						+ "&titulo=" + rs.getString("titulo")
						+ "&img=" + rs.getString("img")
						+ "&descricao=" + rs.getString("descricao")
						+ "&dataPublicacao=" + rs.getString("dataPublicacao")
						+ "&autor=" + rs.getString("autor")
						+ "&idCategoria=" + rs.getString("idCategoria")
						+ "' style='padding-right:5px;'>" 
						+ "<button type='submit' class='btn btn-success'>Editar</button>"
						+ "<a href='deletarPost.jsp?idPost=" + rs.getString("idPost") + "'>" 
						+ "<button type='submit' class='btn btn-danger'>Deletar</button>"
						+ "</td>";
				saida += "</tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public String listarCards() {
		ResultSet rs =  this.dbQuery.select("");
		String saida = "";
		
		try {
			while (rs.next()) {
				
				saida += "<div class='col-sm-6'>" + 
						 "  <div class='card mb-2'>" + 
						 "    <img class='card-img-top' src='" + rs.getString("img") + "' alt='Card image cap'>" + 
						 "    <div class='card-body'>" + 
						 "      <h4 class='card-title'><a>" + rs.getString("titulo") + "</a></h4>" + 
						 "      <p class='card-text'>" + rs.getString("descricao") + "</p>" + 
						 "    </div>" + 
						 "  </div>" +
						 "</div><br>";
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public String listarFilmes () {
		ResultSet rs =  this.dbQuery.select("idCategoria = 1");
		String saida = "";
		
		try {
			while (rs.next()) {
				
				saida += "<div class='col-sm-4'>" + 
						 "  <div class='card mb-2'>" + 
						 "    <img class='card-img-top' src='" + rs.getString("img") + "' alt='Card image cap'>" + 
						 "    <div class='card-body'>" + 
						 "      <h4 class='card-title'><a>" + rs.getString("titulo") + "</a></h4>" + 
						 "      <p class='card-text'>" + rs.getString("descricao") + "</p>" + 
						 "    </div>" + 
						 "  </div>" +
						 "</div><br>";
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public String listarSeries () {
		ResultSet rs =  this.dbQuery.select("idCategoria = 2");
		String saida = "";
		
		try {
			while (rs.next()) {
				
				saida += "<div class='col-sm-4'>" + 
						 "  <div class='card mb-2'>" + 
						 "    <img class='card-img-top' src='" + rs.getString("img") + "' alt='Card image cap'>" + 
						 "    <div class='card-body'>" + 
						 "      <h4 class='card-title'><a>" + rs.getString("titulo") + "</a></h4>" + 
						 "      <p class='card-text'>" + rs.getString("descricao") + "</p>" + 
						 "    </div>" + 
						 "  </div>" +
						 "</div><br>";
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public void deleteById(int idPost) {
		this.dbQuery.deleteById(idPost);
	}
	
}


