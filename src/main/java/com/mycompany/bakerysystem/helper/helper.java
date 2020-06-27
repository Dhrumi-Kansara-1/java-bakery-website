 
package com.mycompany.bakerysystem.helper;
 
public class helper {
    public static String get10Words(String description) {
        String[] str = description.split(" ");
        String res="";
        if(str.length>10) {
            
            
            for(int i=0;i<10;i++) {
                res=res+str[i]+" ";
                
            }
            res=res+" <b>"+" ...</b>";
        }
        else {
            res=description+" <b>"+" ...</b>";
        }
        return res;
    }
}
