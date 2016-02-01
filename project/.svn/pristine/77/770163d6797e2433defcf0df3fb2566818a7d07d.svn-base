package project.mongo;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "debatereply")
public class DebateReply {
	@Id
	private String id;
	public String title;
	public String contents;
	public String agree;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public DebateReply(String title, String contents, String agree) {
		super();
		this.title = title;
		this.contents = contents;
		this.agree = agree;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", title=" + title + ", contents=" + contents + ", agree ="+agree+"]";
	}

}
