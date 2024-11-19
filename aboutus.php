<?php
include('php/functions.php');
headerHTML("About Us");
?>

<div class="container my-5">
  <h1 class="px-3 py-1 text-sm font-semibold text-white bg-gradient-to-r from-[#353839] to-indigo-600 rounded-full text-center ">Meet Our Team</h2>
    <div class="row">
      <!-- Sample Team Member Card -->
      <div class="card w-[17em] h-[28em] bg-[#353839] transition duration-500 ease-in-out clip-path-custom rounded-tr-[20px] rounded-bl-[20px] flex flex-col">
        <p class="p-1"></p>
        <div class="img w-[4.8em] h-[4.8em] bg-[url('media/images/Julian.jpg')] bg-cover bg-center rounded-[15px] mx-auto"></div>
        <span class="font-bold text-white text-center text-[1em] block">Julian</span>
        <span class="text-center text-white font-semibold text-[0.90em]">Arduino Programmer</span>
        <span class="text-center text-white font-medium text-[0.90em] mt-2">Age: 19</span>
        <p class="bio font-normal text-white text-center text-[0.85em] mx-[1em] mt-[0.5em]">
          Hi, I'm Julian!
        </p>
        <p class="info font-normal text-white text-center text-[0.85em] mx-[1em] my-[1em]">
          etc...
        </p>
      </div>
      <!-- Sample Team Member Card -->
      <div class="card w-[17em] h-[28em] bg-[#353839] transition duration-500 ease-in-out clip-path-custom rounded-tr-[20px] rounded-bl-[20px] flex flex-col">
        <p class="p-1"></p>
        <div class="img w-[4.8em] h-[4.8em] bg-[url('media/images/Sjors.jpg')] bg-cover bg-center rounded-[15px] mx-auto"></div>
        <span class="font-bold text-white text-center text-[1em] block">Sjors</span>
        <span class="text-center text-white font-semibold text-[0.90em]">Arduino Programmer</span>
        <span class="text-center text-white font-medium text-[0.90em] mt-2">Age: 23</span>
        <p class="bio font-normal text-white text-center text-[0.85em] mx-[1em] mt-[0.5em]">
          Hi, I'm Sjors!
        </p>
        <p class="info font-normal text-white text-center text-[0.85em] mx-[1em] my-[1em]">
          etc...
        </p>
      </div>
      <!-- Sample Team Member Card -->
      <div class="card w-[17em] h-[28em] bg-[#353839] transition duration-500 ease-in-out clip-path-custom rounded-tr-[20px] rounded-bl-[20px] flex flex-col">
        <p class="p-1"></p>
        <div class="img w-[4.8em] h-[4.8em] bg-[url('media/images/Lucas.jpg')] bg-cover bg-center rounded-[15px] mx-auto"></div>
        <span class="font-bold text-white text-center text-[1em] block">Lucas</span>
        <span class="text-center text-white font-semibold text-[0.90em]">Back-End</span>
        <span class="text-center text-white font-medium text-[0.90em] mt-2">Age: 18</span>
        <p class="bio font-normal text-white text-center text-[0.85em] mx-[1em] mt-[0.5em]">
          Hi, I'm Lucas!
        </p>
        <p class="info font-normal text-white text-center text-[0.85em] mx-[1em] my-[1em]">
          etc...
        </p>
      </div>
      <!-- Sample Team Member Card -->
      <div class="card w-[17em] h-[28em] bg-[#353839] transition duration-500 ease-in-out clip-path-custom rounded-tr-[20px] rounded-bl-[20px] flex flex-col">
        <p class="p-1"></p>
        <div class="img w-[4.8em] h-[4.8em] bg-[url('media/images/Rasmus.PNG')] bg-cover bg-center rounded-[15px] mx-auto"></div>
        <span class="font-bold text-white text-center text-[1em] block">Rasmus</span>
        <span class="text-center text-white font-semibold text-[0.90em]">Front-End</span>
        <span class="text-center text-white font-medium text-[0.90em] mt-2">Age: 21</span>
        <p class="bio font-normal text-white text-center text-[0.85em] mx-[1em] mt-[0.5em]">
          Hi, I'm Rasmus! I love watching football, spending time with friends, and exploring my hobbies of fishing, gaming, and playing football.
        </p>
        <p class="info font-normal text-white text-center text-[0.85em] mx-[1em] my-[1em]">
          I enjoy creating functional websites that are both responsive and user-friendly. My primary programming languages include PHP, Dart, and JavaScript, and I often work with frameworks and tools like Tailwind CSS to streamline development.
        </p>
      </div>
      <!-- Sample Team Member Card -->
      <div class="card w-[17em] h-[28em] bg-[#353839] transition duration-500 ease-in-out clip-path-custom rounded-tr-[20px] rounded-bl-[20px] flex flex-col">
        <p class="p-1"></p>
        <div class="img w-[4.8em] h-[4.8em] bg-[url('media/images/Silas.PNG')] bg-cover bg-center rounded-[15px] mx-auto"></div>
        <span class="font-bold text-white text-center text-[1em] block">Silas</span>
        <span class="text-center text-white font-semibold text-[0.90em]">Front-End</span>
        <span class="text-center text-white font-medium text-[0.90em] mt-2">Age: 19</span>
        <p class="bio font-normal text-white text-center text-[0.85em] mx-[1em] mt-[0.5em]">
          Hi, I'm Silas!
        </p>
        <p class="info font-normal text-white text-center text-[0.85em] mx-[1em] my-[1em]">
          etc...
        </p>
      </div>

      <!-- Custom Clip-path for Tailwind -->
      <style>
        .clip-path-custom {
          clip-path: polygon(30px 0%, 100% 0, 100% calc(100% - 30px), calc(100% - 30px) 100%, 0 100%, 0% 30px);
        }
      </style>

    </div>
</div>

<?php
footerHTML();
?>