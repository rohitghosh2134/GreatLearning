public class Main {
    public static void main(String[] args) {
        HrDepartment hrobj=new HrDepartment();
        AdminDepartment adobj=new AdminDepartment();
        TechDepartment tobj=new TechDepartment();
        String deptName=adobj.departmentName();
        String todaysWork=adobj.getTodaysWork();
        String workDeadline=adobj.getWorkDeadline();
        String isHoliday=adobj.isTodayAHoliday();
        System.out.println("Welcome to " + deptName);
        System.out.println(todaysWork);
        System.out.println(workDeadline);
        System.out.println(isHoliday);
        System.out.println("\n");
        String doAct=hrobj.doActivity();
        deptName=hrobj.departmentName();
        todaysWork=hrobj.getTodaysWork();
        workDeadline=hrobj.getWorkDeadline();
        isHoliday=hrobj.isTodayAHoliday();
        System.out.println("Welcome to " + deptName);
        System.out.println(doAct);
        System.out.println(todaysWork);
        System.out.println(workDeadline);
        System.out.println(isHoliday);
        System.out.println("\n");
        deptName=tobj.departmentName();
        todaysWork=tobj.getTodaysWork();
        workDeadline=tobj.getWorkDeadline();
        isHoliday=tobj.isTodayAHoliday();
        String techStack=tobj.getTechStackInformation();
        System.out.println("Welcome to " + deptName);
        System.out.println(todaysWork);
        System.out.println(workDeadline);
        System.out.println(techStack);
        System.out.println(isHoliday);
        System.out.println("\n");
    }
}
