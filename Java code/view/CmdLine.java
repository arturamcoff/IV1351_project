
package view;

import Controller.Controller;


public class CmdLine {

    private String fullCommand;
    private Cmds command;
    private String[] arguments;


    public CmdLine(String cmd){
        this.fullCommand = cmd;
        processCommand(cmd);

    }

    public Cmds getCommand(){
        return this.command;
    }

    public String[] getArguments(){
        return this.arguments;
    }

    private void processCommand(String cmd){
        String[] cmdPart = cmd.split(" ");
        try {
            this.command = Cmds.valueOf(cmdPart[0].toUpperCase());
            this.arguments = new String[cmdPart.length - 1];

            for (int i = 1; i < cmdPart.length; i++) {
                this.arguments[i - 1] =cmdPart[i]  ;
            }

        }catch(Exception invalidCommandOrArgument){
            this.command = Cmds.ILLEGAL_COMMAND;
        }
    }



}
