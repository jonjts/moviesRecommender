package br.com.jonjts.tcc.moviesrecommender.model;

import com.j256.ormlite.field.DataType;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

import java.util.Date;

/**
 * Author Jonas [@jonjts] [05/11/2016].
 */
@DatabaseTable(tableName = "users")
public class User {

    public static final String TABLE_NAME = "users";

    @DatabaseField(id = true)
    private Integer id;

    @DatabaseField
    private String name;

    @DatabaseField
    private String email;

    @DatabaseField(columnName = "image_link")
    private String imageLink;

    @DatabaseField(dataType = DataType.DATE, format = "dd/MM/yyyy HH:mm")
    private Date register;

    public User() {
    }

    public User(Integer id, String name, String email, String imageLink) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.imageLink = imageLink;
    }

    public User(Integer id) {
        this.id = id;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public Date getRegister() {
        return register;
    }

    public void setRegister(Date register) {
        this.register = register;
    }
}
