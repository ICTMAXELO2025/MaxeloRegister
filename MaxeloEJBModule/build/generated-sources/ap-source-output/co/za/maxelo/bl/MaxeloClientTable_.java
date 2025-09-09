package co.za.maxelo.bl;

import co.za.maxelo.bl.MaxeloAttendenceRegisterTable;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-09-08T11:17:27")
@StaticMetamodel(MaxeloClientTable.class)
public class MaxeloClientTable_ { 

    public static volatile SingularAttribute<MaxeloClientTable, String> password;
    public static volatile SingularAttribute<MaxeloClientTable, String> names;
    public static volatile SingularAttribute<MaxeloClientTable, String> phoneNumber;
    public static volatile SingularAttribute<MaxeloClientTable, String> role;
    public static volatile SingularAttribute<MaxeloClientTable, String> surname;
    public static volatile SingularAttribute<MaxeloClientTable, Long> id;
    public static volatile SingularAttribute<MaxeloClientTable, String> position;
    public static volatile SingularAttribute<MaxeloClientTable, String> email;
    public static volatile ListAttribute<MaxeloClientTable, MaxeloAttendenceRegisterTable> attendanceRecords;

}