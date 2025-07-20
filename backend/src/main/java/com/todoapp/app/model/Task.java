package com.todoapp.app.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private LocalDateTime date;

    // @Column(nullable = false)
    @JsonProperty("done")
    private boolean isDone;

    public boolean isIsDone() {
        return this.isDone;
    }

    public void setIsDone(boolean done) {
        isDone = done;
    }
}
