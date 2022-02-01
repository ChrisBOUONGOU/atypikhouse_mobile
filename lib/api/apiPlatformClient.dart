import 'constant.dart';

Future<void> fetchAPI(uri, accept,payload,{method = "GET"} ) async {
  if (!accept) {
    accept = "application/json";
  }
  var headers = {
    "Content-Type": "application/json",
    "Accept": accept,
    "X-APP-ID": "nextjs",
    "X-APP-SECRET": "jRGxlaNOSyZpvK5fExpErAhXrQR/2jYp0gaznR/v2+I=SECRET=W/EbI4M1kY6apn7cgotj/",
  };

  //if (session && session.accessToken) {
  //  headers = { AUTHORIZATION: session.accessToken, ...headers };
  //}

  const res = await fetch(API_URL + uri, {
    method: method,
    headers: headers,
    body: payload ? JSON.stringify(payload) : null,
  });

  return await res;
}

const apiPlatformClient = {
  get: async (uri, data) => {
    return (await fetchAPI(uri, "GET", data)).json();
  },
  post: async (uri, data) => {
    return (await fetchAPI(uri, "POST", data)).json();
  },
  put: async (uri, data) => {
    return (await fetchAPI(uri, "PUT", data)).json();
  },
  delete: async (uri, data) => {
    return await fetchAPI(uri, "DELETE", { accept: "*/*" });
  },
  patch: async (uri, data) => {
    return (await fetchAPI(uri, "PATCH", data)).json();
  },
};

export default apiPlatformClient;
