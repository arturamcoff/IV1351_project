import Controller.Controller;
        import view.UserInteraction;

public class main {

    public static void main(String[] args) {
        Controller controller = new Controller();
        UserInteraction interaction = new UserInteraction(controller);
        interaction.readCommands();
    }
}
