package models;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DBQuery;

public class Categoria {
	
	private String tableName  = "categoria";
	private String fieldsName = "idCategoria, descricao";
	private String fieldKey   = "idCategoria";

	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	 
	public Categoria() {}
	
	public String listarCategorias() {
		ResultSet rs =  this.dbQuery.select("");
		String saida = "";
		
		try {
			while (rs.next()) {
				saida += "<option value=" + rs.getString("idCategoria") + ">";
				saida += rs.getString("descricao");
				saida += "</option>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
}


