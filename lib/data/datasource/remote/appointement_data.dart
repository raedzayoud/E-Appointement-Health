import 'package:health/core/class/crud.dart';
import 'package:health/linkapi.dart';

class AppointementData {
  Crud crud;

  AppointementData(this.crud);

  add(String userid, String doctorid, DateTime date,
      String appointement_heure) async {
    var response = await crud.postData(AppLinkApi.addappointement, {
      "userid": userid,
      "doctorid": doctorid,
      "date": date.toString(),
      "appointement_heure": appointement_heure
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  view(String userid) async {
    var response = await crud.postData(AppLinkApi.viewappointement, {
      "userid": userid,
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  cancelled(String userid, String appointementid) async {
    var response = await crud.postData(AppLinkApi.cancelledapp,
        {"userid": userid, "appointementid": appointementid});

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  viewcancelled(String userid) async {
    var response =
        await crud.postData(AppLinkApi.viewcancelled, {"userid": userid});

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  completedapp(String userid, String appointementid, String doctorid) async {
    var response = await crud.postData(AppLinkApi.completedapp, {
      "userid": userid,
      "appointementid": appointementid,
      "doctorid": doctorid
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  viewcompletedapp(String userid) async {
    var response =
        await crud.postData(AppLinkApi.viewcompletedapp, {"userid": userid});

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  resheduleapp(String appointementheure, String appointementdate, String userid,
      String appointementid) async {
    var response = await crud.postData(AppLinkApi.recheduleappointement, {
      "appointementdate": appointementdate,
      "appointementheure": appointementheure,
      "userid": userid,
      "appointementid": appointementid
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  deleteapp(String userid, String doctorid, String appointementid) async {
    var response = await crud.postData(AppLinkApi.deleteAppointement, {
      "userid": userid,
      "doctorid": doctorid,
      "appointement_id": appointementid
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }
}
