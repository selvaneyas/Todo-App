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

    private boolean done;

    // public void IsDone(boolean done) {
    //     this.done = done;
    // }

    // // public void setDone(boolean done) {
    // //     this.done = done;
    // // }
}
