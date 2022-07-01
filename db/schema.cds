namespace mycapservice.schema;

using {
    Country,
    Currency,
    cuid,
    managed
} from '@sap/cds/common';


entity EmployeeMaster : cuid, managed {
    employeeCode          : String(10);
    firstName             : String(40);
    lastname              : String(40);
    age                   : Integer;
    gender                : String(10);
    dateOfBirth           : Date;
    nationality           : String;
    Email                 : String;
    mobile                : String(15);
    employeeType          : String(15);
    employeeActive        : Boolean;
    marriedStatus         : String;
    departmentCode        : String(10);
    departmentName        : String(40);
    departmentDescription : String(100);
    employeeExperience    : Composition of many EmployeeExperience
                                on employeeExperience.employeeMaster = $self;
    employeeEducation     : Composition of many EmployeeEduction
                                on employeeEducation.employeeMaster = $self;
    employeeAddress       : Composition of many EmployeeAddress
                                on employeeAddress.employeeMaster = $self;
    employeeLeaves        : Composition of many EmployeeLeaves
                                on employeeLeaves.employeeMaster = $self;
    employeeAssets        : Composition of many Assets
                                on employeeAssets.employeeMaster = $self;
}

entity EmployeeEduction : cuid, managed {
    EducationID    : String(10);
    instituteName  : String;
    courseName     : String;
    courseType     : String;
    startDate      : Date;
    endDate        : Date;
    location       : String;
    markScored     : String(10);
    employeeMaster : Association to one EmployeeMaster;
}

entity EmployeeExperience : cuid, managed {
    organizationName   : String;
    totalExperience    : Integer;
    destination        : String;
    skillSet           : String;
    relevantExperience : Integer;
    startDate          : Date;
    endDate            : Date;
    salary             : Decimal(10, 2);
    currency           : Currency;
    branchCode         : String;
    location           : String;
    employeeMaster     : Association to one EmployeeMaster;
}

entity EmployeeAddress : cuid, managed {
    doorNo             : String(5);
    streetName         : String;
    city               : String;
    state              : String;
    country            : Country;
    postalCode         : Integer;
    isPremanentAddress : Boolean;
    isCurrentAddress   : Boolean;
    employeeMaster     : Association to one EmployeeMaster;
}

entity EmployeeLeaves : cuid, managed {
    startDate      : Date;
    endDate        : Date;
    leaveType      : String;
    status         : String;
    remark         : String;
    employeeMaster : Association to one EmployeeMaster;
}

entity Department : cuid, managed {
    code        : String(10);
    name        : String(40);
    description : String(100);
}

entity Assets : cuid, managed {
    assetCode        : String(10);
    assetName        : String;
    assetDescription : String;
    assetType        : String;
    purchaseDate     : Date;
    purchaseTime     : Time;
    employeeMaster   : Association to one EmployeeMaster;
}
