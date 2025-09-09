package co.za.maxelo.bl;

import co.za.maxelo.bl.MaxeloClientTable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-09-08T11:17:27")
@StaticMetamodel(MaxeloAttendenceRegisterTable.class)
public class MaxeloAttendenceRegisterTable_ { 

    public static volatile SingularAttribute<MaxeloAttendenceRegisterTable, String> attendanceType;
    public static volatile SingularAttribute<MaxeloAttendenceRegisterTable, String> notes;
    public static volatile SingularAttribute<MaxeloAttendenceRegisterTable, MaxeloClientTable> client;
    public static volatile SingularAttribute<MaxeloAttendenceRegisterTable, Long> id;
    public static volatile SingularAttribute<MaxeloAttendenceRegisterTable, LocalDate> attendanceDate;
    public static volatile SingularAttribute<MaxeloAttendenceRegisterTable, LocalDateTime> timeIn;
    public static volatile SingularAttribute<MaxeloAttendenceRegisterTable, LocalDateTime> timeOut;

}