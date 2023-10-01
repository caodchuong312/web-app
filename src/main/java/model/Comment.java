package model;

import java.sql.Date;

public class Comment {
    private int id;
    private int postId;
    private String authorName;
    private String content;

    public Comment(){}

    public Comment(int id, int postId, String authorName, String content) {
        this.id = id;
        this.postId = postId;
        this.authorName = authorName;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }



}
