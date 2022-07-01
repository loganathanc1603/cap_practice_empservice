using {mycapservice.schema as my} from '../db/schema';

service EmployeeService @(path : 'browse') {

    entity EmployeeMaster     as
        select from my.EmployeeMaster {
            *
        };

    entity EmployeeExperience as
        select from my.EmployeeExperience {
            *
        };

    entity EmployeeEduction   as
        select from my.EmployeeEduction {
            *
        };

    entity EmployeeAddress    as
        select from my.EmployeeAddress {
            *
        };

    entity EmployeeLeaves     as
        select from my.EmployeeLeaves {
            *
        };

    entity Assets             as
        select from my.Assets {
            *
        }
}
