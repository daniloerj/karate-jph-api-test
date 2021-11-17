package trello.boards;

import com.intuit.karate.junit5.Karate;

public class BoardsRunner {
    @Karate.Test
    Karate testBoards() {
        return Karate.run("board-crud").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:trello/boards/board-crud.feature")
                .karateEnv("dev")
                .systemProperty("foo", "facebook");
    }
}
