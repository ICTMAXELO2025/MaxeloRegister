/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.businesslogic;

import co.za.maxelo.bl.MaxeloClientTable;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author cash
 */
@Stateless
public class MaxeloClientTableFacade extends AbstractFacade<MaxeloClientTable> implements MaxeloClientTableFacadeLocal {

    @PersistenceContext(unitName = "MaxeloEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaxeloClientTableFacade() {
        super(MaxeloClientTable.class);
    }
    // In MaxeloClientTableFacade implementation

    @Override
    public MaxeloClientTable findByEmail(String email) {
        try {
            return (MaxeloClientTable) getEntityManager()
                    .createQuery("SELECT u FROM MaxeloClientTable u WHERE u.email = :email")
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
