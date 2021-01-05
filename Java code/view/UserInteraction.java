package view;

import Controller.Controller;
import model.InstrumentForRent;

import java.util.ArrayList;
import java.util.Scanner;

public class UserInteraction {

    private final Scanner input = new Scanner(System.in);
    private Controller controller;


    public UserInteraction(Controller controller){
        this.controller = controller;
    }


    public void readCommands(){
        boolean stopRead = false;

        while(!stopRead){
            String line = input.nextLine();
            CmdLine command = new CmdLine(line);

            switch(command.getCommand()){
                case ILLEGAL_COMMAND:
                    System.out.println("Illegal command");
                    break;

                case QUIT:
                    stopRead = true;
                    break;

                case LIST_RENT:
                    ArrayList<InstrumentForRent> returnList;
                    if(command.getArguments()[0] == null){
                        returnList = controller.listRent("");
                    }else{
                        returnList = controller.listRent(command.getArguments()[0]);
                    }
                    System.out.println("Instrument number - Brand - Price");
                    for(InstrumentForRent x : returnList){
                        System.out.println(x.getID() + " \t" + x.getBrand() + "\t " + x.getPrice());
                    }
                    break;

                case RENT:

                    try {
                        controller.addRent(command.getArguments()[0], command.getArguments()[1], command.getArguments()[2]);
                    }catch (Exception e1){
                        System.out.println(e1.getMessage());
                    }
                    break;

                case RETURN_RENT:

                    try{
                        controller.removeRent(command.getArguments()[0]);
                    }catch (Exception e1){
                        System.out.println(e1.getMessage());
                    }
            }
        }
    }
}
