<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Client;

class carouselController extends Controller
{
    public function mainCarousel()
    {
        $dataCarousel =$this->getAllDataCarousel();

        return view('home', [ 'dataCarousel' => $dataCarousel]);
    }

    public function getAllDataCarousel()
    {
        $client = new Client();

        try {
            $response = $client->get('http://localhost:4000/carousel/getCarousel');
            $data = json_decode($response->getBody(), true);
            return $data;
        } catch (\Throwable $th) {
            return redirect()->route('home')->withErrors(['data' => 'Data tidak ditemukan.' . $th->getMessage()]);
        }
    }
}
