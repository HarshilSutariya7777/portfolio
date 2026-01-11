'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9c0332b583bf1f0a7731ea8e292d37b9",
"assets/AssetManifest.bin.json": "50e9b8b4e2882b0cfb03174328d18e1e",
"assets/AssetManifest.json": "178fab8a629fbb42d25113184f3d4d97",
"assets/assets/images/1.jpeg": "3a7c0bbf00cb1149f69f8fb9c61a234e",
"assets/assets/images/3d/asp.webp": "9a179fd36c6e0197478af4b6f936bc65",
"assets/assets/images/3d/aws.png": "c7a7f60cb22aba9392a2026e5a42bdc1",
"assets/assets/images/3d/career.webp": "17e2ae54e9602a3983e86fe024d2e2de",
"assets/assets/images/3d/cloud.png": "2c8639654831aa8414f5e6106b577591",
"assets/assets/images/3d/communication.webp": "21b479e0a3e30c25c40e0c01fecc8103",
"assets/assets/images/3d/dart.webp": "3acd5f8587330e8030570bff7412ed3e",
"assets/assets/images/3d/dbms.webp": "34b5d0e41b8418422d97ce5413466def",
"assets/assets/images/3d/figma.webp": "8d705a8da5f2a47199f32f93f30ee57c",
"assets/assets/images/3d/firebase.png": "7c33a71510e379edeac47c21cdf4a5c6",
"assets/assets/images/3d/flutter.png": "6d8846b76239d5eb2b3c37e7a620a236",
"assets/assets/images/3d/git.webp": "c56df5d0dac51250debf1d5f1929085a",
"assets/assets/images/3d/interview.webp": "b9f66ca17fc398f003cd9182b0833806",
"assets/assets/images/3d/java.webp": "5d5f4c67344617175a627ac36f023e5d",
"assets/assets/images/3d/mail.png": "91d6e8d2b416248ce0c51102d2651746",
"assets/assets/images/3d/mongo.png": "4c00d7864f5d054e61a68005489578ff",
"assets/assets/images/3d/node.webp": "9c33f8e2052083a79b8dbdbf311b529c",
"assets/assets/images/3d/php.png": "53e017a5ee5880507973d2fc97c4973a",
"assets/assets/images/3d/react.png": "4289d3d31c20966f18662731062cdf93",
"assets/assets/images/3d/sop.webp": "861794bbc90e1812f27d66baae351579",
"assets/assets/images/3d/sql.webp": "02285b905fc1ea66ef7fe4f303ed154b",
"assets/assets/images/3d/sus.webp": "b4d4799b63bdd43b26bb022621a750eb",
"assets/assets/images/android.png": "0de331c2009642f9b76d0713501f9a45",
"assets/assets/images/app-store.png": "331db383cd183123e21c0e895056b475",
"assets/assets/images/Canva.png": "24b3e67e211bfdbb8c2b9fc6921ca433",
"assets/assets/images/chatgpt.png": "ea61e9426c94cb4debc07e29a11fa615",
"assets/assets/images/dart.png": "31976ff22bb0bd0ce18da966097ac742",
"assets/assets/images/flutter.png": "e1dacf68c8e19e3d28ae7f678e75e7cc",
"assets/assets/images/golfswings/1.png": "e289593b061bb7454c5711c46cc8dce2",
"assets/assets/images/golfswings/10.png": "454ba6ca61bb48e348139c9632d58622",
"assets/assets/images/golfswings/11.png": "00584ad14c0462dc1dd3f0ee23894f28",
"assets/assets/images/golfswings/12.png": "0ded7670f2938d6fed3d83f540a1f90a",
"assets/assets/images/golfswings/13.png": "e8cb655fcbba19f5bf8d0ba22d20a5f9",
"assets/assets/images/golfswings/14.png": "fe451cce42e9973df54220f9cee35451",
"assets/assets/images/golfswings/15.png": "b9d4a604497ea72b58a532f2789eda9c",
"assets/assets/images/golfswings/16.png": "9e11c993623a9080b1917c76ffcdbf20",
"assets/assets/images/golfswings/2.png": "99bcd1081c1c9d8bebca6a40b042f0b7",
"assets/assets/images/golfswings/3.png": "3e3a3187f78ed10e99d31381da64aa1b",
"assets/assets/images/golfswings/4.png": "60d6dd05eb17a78f5d621a01201657ff",
"assets/assets/images/golfswings/5.png": "f6f93f87148bbcf38ef39edb91b20e74",
"assets/assets/images/golfswings/6.png": "b3f6104f3fb7e73747f65b0e06519862",
"assets/assets/images/golfswings/7.png": "7e85d455c8da25aaa4b031ff21509808",
"assets/assets/images/golfswings/8.png": "9a5a1fe29194f670a2e091ea3c6ae2e1",
"assets/assets/images/golfswings/9.png": "95c8422d7b7bd0cfcd8081058c5088b6",
"assets/assets/images/golfswings/app_logo.png": "e424626bd0e024dddf4679065b78d5d5",
"assets/assets/images/Google.webp": "7692e89ea212c4af02263d81d33df042",
"assets/assets/images/guidebook/1.jpeg": "76033dfcfe55019b1956707e65ca670b",
"assets/assets/images/guidebook/10.jpeg": "03f29221fe59fc5321e22b3c68991d6d",
"assets/assets/images/guidebook/11.jpeg": "dd326d901b2b616dbc2e1c872c901570",
"assets/assets/images/guidebook/12.jpeg": "8a76edc0203d644146edba334bd75755",
"assets/assets/images/guidebook/2.jpeg": "e366ceebbed0c7eeef6c638bcbe28000",
"assets/assets/images/guidebook/3.jpeg": "457581fa22661d903814c2ca7e02892d",
"assets/assets/images/guidebook/4.jpeg": "ae42b23113ec6174016f3bf9d5b0ef23",
"assets/assets/images/guidebook/5.jpeg": "f1269f505c6b8c46399e1d226b004c09",
"assets/assets/images/guidebook/6.jpeg": "541c8d66fefd36dccaf6d95c2e61449b",
"assets/assets/images/guidebook/7.jpeg": "da7e251c26dd68734bb25c2be363cb4d",
"assets/assets/images/guidebook/8.jpeg": "7900b033b81139d9a5a6497bb4bd1eca",
"assets/assets/images/guidebook/9.jpeg": "b94044d5d78b5a63f5cfcab7a12c6686",
"assets/assets/images/guidebook/preview_bg.png": "d5c8992d3c3dec03a7a98cb45fbe4262",
"assets/assets/images/harshil.png": "8fd7fae21613d1952c466018a8491ff8",
"assets/assets/images/logo.png": "f309cfec79ddd20ab7ee4e33db2b1a8a",
"assets/assets/images/mysql.png": "c8d566d3e24cdf218d96f3aaf4533528",
"assets/assets/images/node.svg": "89ccb09060a7adf788ea2340c54d6d78",
"assets/assets/images/notion.png": "c2976966124ad737c6e67e8be5057417",
"assets/assets/images/PHP-logo.svg": "cdf5b5e1a8dd51c1130b4d4a86048b8a",
"assets/assets/images/pingmoney/1.jpeg": "b5f37bfd3c55555d2b5937792548647c",
"assets/assets/images/pingmoney/10.jpeg": "74ea59a1d53cd0f1eef586d9f73d5bf8",
"assets/assets/images/pingmoney/11.jpeg": "d708659ecdeff889a6d00e036af1b7bd",
"assets/assets/images/pingmoney/12.jpeg": "440e170599db85c1a27cca13e403d281",
"assets/assets/images/pingmoney/13.jpeg": "b9bf06f66309927d7751ce2125998f03",
"assets/assets/images/pingmoney/14.jpeg": "7df831f92fbbbe32ce828e83ace6eea4",
"assets/assets/images/pingmoney/15.jpeg": "05edb541ec4f8d990e456e409d21d056",
"assets/assets/images/pingmoney/16.jpeg": "78c43b6b45c4b1b368c7347510e2e455",
"assets/assets/images/pingmoney/17.jpeg": "18cbb5114ba9e00500bc758e0280978f",
"assets/assets/images/pingmoney/18.jpeg": "de872628081a118ca310f5b7a5feb2a0",
"assets/assets/images/pingmoney/19.jpeg": "f99393838b51f13047ba5e1a392a4829",
"assets/assets/images/pingmoney/2.jpeg": "08350913e150c8eb54f8e29155c6f4e4",
"assets/assets/images/pingmoney/20.jpeg": "f54fa85330800d64027cb94841c556f8",
"assets/assets/images/pingmoney/21.jpeg": "2082fe13361241c59d639b0f412612ce",
"assets/assets/images/pingmoney/22.jpeg": "63d241081053f1e988002e7aa7de00a5",
"assets/assets/images/pingmoney/23.jpeg": "529f6615c6a7e2a509b3cbd1d4e890fb",
"assets/assets/images/pingmoney/3.jpeg": "0452a290acee41d5b24897c189015648",
"assets/assets/images/pingmoney/4.jpeg": "bec6e27a30916a130b06a193d2d96ab1",
"assets/assets/images/pingmoney/5.jpeg": "f6e3894bf7366554aae7f2ce5d57e4e1",
"assets/assets/images/pingmoney/6.jpeg": "bc22f1d2ebbeca695d229fee8f75f565",
"assets/assets/images/pingmoney/7.jpeg": "1d761bffa861d21be04281fa661eef82",
"assets/assets/images/pingmoney/8.jpeg": "ef36589cbf2e9962df3f1c240d7fc79b",
"assets/assets/images/pingmoney/9.jpeg": "c2285f897d06be76b7d8d4fb9576b698",
"assets/assets/images/pingmoney/ping_image.png": "6d69c7bfb963e4b74c47198bedb8af5d",
"assets/assets/images/play.png": "6b90f19a3e7de7f7079ebc4f0d3e87dc",
"assets/assets/images/react.png": "217c2162dfe605f4a659a436ec58bc08",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "675bd97076522984fbef5271dd7c4f57",
"assets/NOTICES": "aefc603095659b326fb7c99eb27d8eab",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "dc2c76cafb9e7526c5accd0b4d7956b9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "dd7f6ec54f40a225bbd4764c8f3e6a89",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "4379231acbb4477cec6a39080dc95a4b",
"assets/packages/youtube_player_iframe/assets/player.html": "663ba81294a9f52b1afe96815bb6ecf9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "e29b16af0aa1d1bfbc5ae43436bc6b42",
"icons/Icon-192.png": "f888672711eabe7bf4abce0b8c280f2a",
"icons/Icon-512.png": "f888672711eabe7bf4abce0b8c280f2a",
"icons/Icon-maskable-192.png": "f888672711eabe7bf4abce0b8c280f2a",
"icons/Icon-maskable-512.png": "f888672711eabe7bf4abce0b8c280f2a",
"index.html": "5b16df7a3b3ab9d48bbcbccc4a6edcdb",
"/": "5b16df7a3b3ab9d48bbcbccc4a6edcdb",
"main.dart.js": "25f8ace0be5326b68b476383616b90e1",
"manifest.json": "e23786a3ac8247093937c280f2da4a52",
"version.json": "675ff03f24b7fbc8ee0807b9d970d193"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
