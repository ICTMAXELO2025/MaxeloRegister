/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.businesslogic;

import co.za.maxelo.bl.MaxeloClientTable;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author cash
 */
@Local
public interface MaxeloClientTableFacadeLocal {

    void create(MaxeloClientTable maxeloClientTable);

    void edit(MaxeloClientTable maxeloClientTable);

    void remove(MaxeloClientTable maxeloClientTable);

    MaxeloClientTable find(Object id);

    public MaxeloClientTable findByEmail(String email);
    List<MaxeloClientTable> findAll();

    List<MaxeloClientTable> findRange(int[] range);

    int count();
    
}
