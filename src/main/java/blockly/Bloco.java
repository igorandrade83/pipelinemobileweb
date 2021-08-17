package blockly;

import cronapi.*;
import cronapi.rest.security.CronappSecurity;
import java.util.concurrent.Callable;



@CronapiMetaData(type = "blockly")
@CronappSecurity
public class Bloco {

public static final int TIMEOUT = 300;

/**
 * Bloco
 *
 *
 * @author Igor Andrade
 * @since 30/06/2021 15:18:47
 *
 */
public static Var Executar() throws Exception {
 return new Callable<Var>() {

   public Var call() throws Exception {

    System.out.println( cronapi.util.Operations.setCookie( Var.valueOf("") ,  Var.valueOf("") ,  Var.valueOf("SECONDS") ,  Var.VAR_NULL ) .getObjectAsString());
    return Var.VAR_NULL;
   }
 }.call();
}

}

