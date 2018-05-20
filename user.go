package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var db *gorm.DB
var err error

type User struct {
	gorm.Model
	id       int
	Nama     string
	Email    string `gorm:"type:varchar(100);unique_index"` // `type` set sql type, `unique_index` will create unique index for this column
	Password string
}

func openDB() {
	db, err = gorm.Open("mysql", "root:@tcp(127.0.0.1:3306)/golang?charset=utf8&parseTime=True&loc=Local")
	if err != nil {
		fmt.Println(err)
	}
	db.AutoMigrate(&User{})

	fmt.Println("open db")

	//db.CreateTable(&User{})
}

func closeDB() {
	defer db.Close()
	fmt.Println("close db")
}

func allData(w http.ResponseWriter, r *http.Request) {
	openDB()

	var allUsers []User
	db.Order("id desc").Find(&allUsers)
	json.NewEncoder(w).Encode(allUsers)

	closeDB()
}

func singleData(w http.ResponseWriter, r *http.Request) {
	openDB()

	vars := mux.Vars(r)
	nama := vars["nama"]

	var allUsers []User
	db.Where("nama LIKE ?", "%"+nama+"%").Find(&allUsers)
	json.NewEncoder(w).Encode(allUsers)

	closeDB()
}

func addData(w http.ResponseWriter, r *http.Request) {
	openDB()

	vars := mux.Vars(r)
	nama := vars["nama"]
	email := vars["email"]
	password := vars["password"]

	var data = User{Nama: nama, Email: email, Password: password}
	db.Create(&data)

	closeDB()
}

func updateData(w http.ResponseWriter, r *http.Request) {
	openDB()
	vars := mux.Vars(r)
	id := vars["id"]
	nama := vars["nama"]
	email := vars["email"]
	password := vars["password"]

	var user User
	db.Where("id = ?", id).Find(&user)

	user.Email = email
	user.Nama = nama
	user.Password = password
	db.Save(&user)

	fmt.Println("update sukses")
	closeDB()
}

func deleteData(w http.ResponseWriter, r *http.Request) {
	openDB()
	vars := mux.Vars(r)
	id := vars["id"]

	var user User
	db.Where("id = ?", id).Find(&user)
	db.Delete(&user)

	fmt.Println("delete sukses")
	closeDB()
}
