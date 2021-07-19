using DotNetCoreCRUDWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DotNetCoreCRUDWebApp.Controllers
{
    public class StudentController : Controller
    {
        private readonly StudentContext _Db;

        public StudentController(StudentContext Db)
        {
            _Db = Db;
        }

        public IActionResult StudentList()
        {
            try
            {
                //var stdList = _Db.Student_tb.ToList();

                var stdList = from a in _Db.Student_tb
                              join b in _Db.Department_tb
                              on a.DeptId equals b.Id
                              into Dept
                              from b in Dept.DefaultIfEmpty()

                              select new Student
                              {
                                  Id = a.Id,
                                  Name = a.Name,
                                  FName = a.FName,
                                  Mobile = a.Mobile,
                                  Email = a.Email,
                                  Description = a.Description,
                                  DeptId = a.DeptId,
                                  Department = b == null ? "" : b.Department
                              };

                return View(stdList);
            }
            catch (Exception ex)
            {

                return View();
            }

        }

        public IActionResult Create(Student obj)
        {
            loadDeptList();
            return View(obj);
        }

        [HttpPost]
        public async Task<IActionResult> AddStudent(Student obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (obj.Id == 0)
                    {
                        _Db.Student_tb.Add(obj);
                        await _Db.SaveChangesAsync();
                    }
                    else
                    {
                        _Db.Entry(obj).State = EntityState.Modified;
                        await _Db.SaveChangesAsync();
                    }


                    return RedirectToAction("StudentList");
                }
                return View(obj);
            }
            catch (Exception ex)
            {

                return RedirectToAction("StudentList");
            }
        }

        private void loadDeptList()
        {
            try
            {
                List<Departments> deptList = new List<Departments>();
                deptList = _Db.Department_tb.ToList();

                deptList.Insert(0, new Departments { Id = 0, Department = "----Please Select----" });

                ViewBag.DeptList = deptList;
            }
            catch (Exception ex)
            {

                
            }
        }
    }
}
