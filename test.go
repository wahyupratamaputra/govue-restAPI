package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func helloworld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Oioioi hello")
}

func theRouter() {
	myRouter := mux.NewRouter().StrictSlash(true)
	myRouter.HandleFunc("/", helloworld).Methods("GET")
	myRouter.HandleFunc("/datas", allData).Methods("GET")
	myRouter.HandleFunc("/data/{nama}", singleData).Methods("GET")
	myRouter.HandleFunc("/adddata/{nama}/{email}/{password}", addData).Methods("POST")
	myRouter.HandleFunc("/editdata/{id}/{nama}/{email}/{password}", updateData).Methods("PUT")
	myRouter.HandleFunc("/delete/{id}", deleteData).Methods("DELETE")
	log.Fatal(http.ListenAndServe(":1111", myRouter))
}

func main() {

	fmt.Println("Goooooo Running")
	theRouter()

}
