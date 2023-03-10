import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/countries.dart';
import '../../modules/home/controllers/home_controller.dart';

class SearchcountryView extends StatefulWidget {
  const SearchcountryView({Key? key}) : super(key: key);

  @override
  State<SearchcountryView> createState() => _SearchcountryViewState();
}

class _SearchcountryViewState extends State<SearchcountryView> {
  final controller = Get.put(HomeController(), permanent: true);

  var isDropDownClicked = false;
  var isCityDropDownClicked = false;
  int? selectedIndex;

  final countryController = TextEditingController();

  final cityController = TextEditingController();
  List countrySearch = [];
  List citySearch = [];

  void _countryData(String query) {
    setState(() {
      isDropDownClicked = true;
      isCityDropDownClicked = false;
      countrySearch = [];
      for (Map<String, dynamic> country in CountriesData.cityData) {
        if (country['country'].toLowerCase().contains(query.toLowerCase())) {
          countrySearch.add(country['country']);
        }
      }
    });
  }

  void _cityData(String query) {
    setState(() {
      isCityDropDownClicked = true;
      citySearch = [];
      for (Map<String, dynamic> country in CountriesData.cityData) {
        country['city'].forEach((city) {
          if (city.toLowerCase().contains(query.toLowerCase())) {
            citySearch.add(city);
          }
        });
      }
    });
  }

  void _myItemIndex(String item) {
    int? index;
    countryController.text = item;
    index = CountriesData.cityData
        .indexWhere((element) => element['country'] == item);
    selectedIndex = index;
    setState(() {
      isDropDownClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SafeArea(
              child: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 47.0, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.47,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: countryController,
                                    onChanged: (value) {
                                      _countryData(value);
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isDropDownClicked =
                                                  !isDropDownClicked;
                                            });

                                            // if (isDropDownClicked == true) {
                                            //   isDropDownClicked = false;
                                            // } else {
                                            //   isDropDownClicked = true;
                                            // }
                                          },
                                          child: const Icon(
                                              Icons.keyboard_arrow_down)),
                                      hintText: 'Country',
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.47,
                              child: TextField(
                                controller: cityController,
                                onChanged: (val) {
                                  selectedIndex == null ? null : _cityData(val);
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        if (selectedIndex == null) {
                                          Get.snackbar('Info.',
                                              'Please Select a Country!',
                                              colorText: Colors.white,
                                              icon: const Icon(
                                                  Icons.info_outlined,
                                                  color: Colors.red),
                                              duration:
                                                  const Duration(seconds: 3),
                                              snackPosition: SnackPosition.TOP);
                                          setState(() {
                                            isCityDropDownClicked = false;
                                          });
                                        } else {
                                          setState(() {
                                            isCityDropDownClicked =
                                                !isCityDropDownClicked;
                                          });
                                          // if (isCityDropDownClicked == true) {
                                          //   isCityDropDownClicked = false;
                                          // } else {
                                          //   isCityDropDownClicked = true;
                                          // }
                                        }
                                      },
                                      child: const Icon(
                                          Icons.keyboard_arrow_down)),
                                  hintText: 'City',
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade400),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isDropDownClicked
                                ? Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    height: 400,
                                    color: Colors.grey.shade200,
                                    child: countrySearch.isNotEmpty
                                        ? ListView.builder(
                                            itemCount: countrySearch.length,
                                            itemBuilder: ((context, index) {
                                              return ListTile(
                                                  title: Text(
                                                      countrySearch[index]),
                                                  onTap: () {
                                                    _myItemIndex(
                                                        countrySearch[index]);
                                                  });
                                            }))
                                        : ListView.builder(
                                            itemCount:
                                                CountriesData.cityData.length,
                                            itemBuilder: ((context, index) {
                                              return ListTile(
                                                  title: Text(CountriesData
                                                          .cityData[index]
                                                      ["country"]),
                                                  onTap: () {
                                                    selectedIndex = index;
                                                    countryController.text =
                                                        CountriesData
                                                                .cityData[index]
                                                            ["country"];
                                                    setState(() {
                                                      isDropDownClicked = false;
                                                    });
                                                  });
                                            })))
                                : const SizedBox(),
                            isCityDropDownClicked
                                ? Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    height: 400,
                                    color: Colors.grey.shade200,
                                    child: citySearch.isNotEmpty
                                        ? ListView.builder(
                                            itemCount: citySearch.length,
                                            itemBuilder: ((context, index) {
                                              return ListTile(
                                                  title:
                                                      Text(citySearch[index]),
                                                  onTap: () {
                                                    cityController.text =
                                                        citySearch[index];
                                                    setState(() {
                                                      isCityDropDownClicked =
                                                          false;
                                                    });
                                                  });
                                            }))
                                        : ListView.builder(
                                            itemCount: CountriesData
                                                .cityData[selectedIndex!]
                                                    ["city"]
                                                .length,
                                            itemBuilder: ((context, index) {
                                              return ListTile(
                                                  title: Text(
                                                      CountriesData.cityData[
                                                              selectedIndex!]
                                                          ["city"][index]),
                                                  onTap: () {
                                                    cityController.text =
                                                        CountriesData.cityData[
                                                                selectedIndex!]
                                                            ["city"][index];
                                                    setState(() {
                                                      isCityDropDownClicked =
                                                          false;
                                                    });
                                                  });
                                            })))
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                                color: Colors.grey.shade300,
                                onPressed: () {
                                  countryController.text = '';
                                  cityController.text = '';
                                  selectedIndex = null;
                                },
                                child:
                                    const Icon(Icons.clear, color: Colors.red)),
                            MaterialButton(
                                color: Colors.grey.shade300,
                                onPressed: () {
                                  if (countryController.text == '' &&
                                      cityController.text == '') {
                                    Get.showSnackbar(const GetSnackBar(
                                        title: 'Error!',
                                        message: "Text Fields can't be empty",
                                        icon: Icon(Icons.error_outlined,
                                            color: Colors.red),
                                        duration: Duration(seconds: 5)));
                                  } else if (countryController.text != '' &&
                                      cityController.text != '') {
                                    controller.getLocation().value =
                                        cityController.text;

                                    if (controller.getLocation().value != "") {
                                      controller.receiver();
                                      Navigator.of(context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  } else if (countryController.text != '' &&
                                      cityController.text == '') {
                                    controller.getLocation().value =
                                        countryController.text;

                                    if (controller.getLocation().value != "") {
                                      controller.receiver();
                                      Navigator.of(context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  } else if (countryController.text == '' &&
                                      cityController.text != '') {
                                    controller.getLocation().value =
                                        cityController.text;

                                    if (controller.getLocation().value != "") {
                                      controller.receiver();
                                      Navigator.of(context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                    }
                                  }
                                },
                                child: const Image(
                                    image: AssetImage(
                                        'Images/nothing-found-100.png'),
                                    height: 30,
                                    width: 30))
                          ]),
                    )
                  ]),
            )),
        GestureDetector(
          onTap: (() => Get.back()),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 6),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey.shade300),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
          ),
        )
      ]))),
    );
  }
}
