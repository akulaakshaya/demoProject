package eStoreProduct.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eStoreProduct.model.Product;

public class ProductDAO {
	private static final String JDBC_DRIVER = "org.postgresql.Driver";
	private static final String DB_URL = "jdbc:postgresql://LocalHost:5432/postgres";
	private static final String USERNAME = "postgres";
	private static final String PASSWORD = "Akshaya@2001";

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<>();

		try {
			Class.forName(JDBC_DRIVER);
			Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);

			String query = "SELECT * FROM productsData";
			PreparedStatement statement = connection.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				double price = resultSet.getDouble("price");
				String description = resultSet.getString("description");
				String imageUrl = resultSet.getString("image_url");
				String category = resultSet.getString("category");

				Product product = new Product(id, name, price, description, imageUrl, category);
				products.add(product);
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<Product> getProductsByCategory(String category) {
		List<Product> products = new ArrayList<>();
		System.out.println(category + " from model");
		try {
			Class.forName(JDBC_DRIVER);
			Connection connection = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			System.out.println(category + " from model");
			String query = "SELECT * FROM productsData WHERE category = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, category);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				double price = resultSet.getDouble("price");
				String description = resultSet.getString("description");
				String imageUrl = resultSet.getString("image_url");

				Product product = new Product(id, name, price, description, imageUrl, category);
				products.add(product);
			}
			System.out.println(products.toString());
			resultSet.close();
			statement.close();
			connection.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return products;
	}
}
