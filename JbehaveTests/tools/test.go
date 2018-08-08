package main

import (
    "net/http"
    "io/ioutil"
	"bytes"
	"net/http/cookiejar"
	"fmt"
	"time"
	//"strings"
)

func get(url string, client *http.Client, i int) {
		start := time.Now()
		resp, err := client.Get(url)
		endTime := time.Now()
		println(fmt.Sprintf("GET %d Request -> %s done at %d milliseconds", i, url, endTime.Sub(start).Nanoseconds() / 1000000))
        if err != nil {
            panic(err)
        }
        _, err = ioutil.ReadAll(resp.Body)
		defer resp.Body.Close()
}


func post(url string, reqBody string, client *http.Client, statusCode int) {
	start := time.Now()
	resp, err := client.Post(url, "application/json", bytes.NewBuffer([]byte(reqBody)))
	endTime := time.Now()
	println(fmt.Sprintf("POST Request -> %s done at %d milliseconds", url, endTime.Sub(start).Nanoseconds() / 1000000))

	if err != nil {
		panic(err)
	}
    //var out []byte
	_, err = ioutil.ReadAll(resp.Body)

    //println(string(out))
    //println(resp.StatusCode)

    if (resp.StatusCode != statusCode)  {
        panic (fmt.Sprintf("status code was not 200 it was %d", resp.StatusCode))
    }
    //if (!strings.Contains(string(out), "188"))  {
    //    panic (fmt.Sprintf("Responce does not contains 188"))
    //}
	defer resp.Body.Close()
}

func counted_post(url string, reqBody string, client *http.Client, statusCode int, run_count int, c chan int) {
	for i := 1;  i<=run_count; i++ {
        post(url, reqBody, client, statusCode)
    }
    c <- run_count
}


func main() {

	options := cookiejar.Options{}
	jar1, _ := cookiejar.New(&options)
	//jar2, _ := cookiejar.New(&options)
	client1 := &http.Client{Jar: jar1}
	//client2 := &http.Client{Jar: jar2}

	baseUrl := "http://web.08.teamcity3.tickerontest.com/"

	// get session cookie
	get(baseUrl, client1, 0)

    // do login
    //post(fmt.Sprintf("%s%s", baseUrl, "api/CxUser/Login"), `{"login": "a1@catch01.tickerontest.com", "password": "qwerty", "rememberMe": true }`, client1, 200)

	// do test
    var run_count int = 100;
    var threads int = 100;
    c := make(chan int)
	for i := 1;  i<=threads; i++ {
            go counted_post(
            fmt.Sprintf("%s%s", baseUrl,  "api/CxMallNew/SearchModelPortfolios"),
            `{"request":{"PageIndex":1,"PageSize":10,"Title":null,"PriceFrom":null,"PriceTo":null,"Positions":null,"MarketValue":null,"RiskLevel":null,"OnlyPublished":true}}`,
            client1,
            200,
            run_count,
            c);
	}

	for i := 1;  i<=threads; i++ {
        <-c
    }
}

