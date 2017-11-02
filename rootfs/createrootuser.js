use admin;
db.createUesr(
    {user : "root", pwd : rootpw, roles : [ {role : "root", db : "admin"} ]});
