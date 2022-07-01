const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {
    this.before('CREATE', 'EmployeeMaster', empData => {
        let oData = empData.data;
        let sEmpCode = new Date().getTime();
        empData.data.employeeCode = "CAP-" + sEmpCode;
        

        if(!oData.nationality){
            empData.data.nationality = "Indian";
        }

        if (!oData.gender) {
            empData.data.gender = "M";
        }

        if (!oData.employeeType) {
            empData.data.employeeType = "P"
        }

        if (!oData.marriedStatus) {
            empData.data.marriedStatus = "S";
        }
    });

    this.after('each', 'EmployeeMaster', empData => {
        if (empData.employeeType === "P") {
            empData.employeeType = "Permanent"
        } else {
            empData.employeeType = "Contract"
        }

        if (empData.marriedStatus === "S") {
            empData.marriedStatus = "Single";
        } else {
            empData.marriedStatus = "Married";
        }

        if (empData.gender === "M") {
            empData.gender = "Male";
        } else {
            empData.gender = "Female";
        }
    });
});
