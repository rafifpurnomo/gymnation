<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use GuzzleHttp\Client;
use Illuminate\Http\Request;

class pengaudanController extends Controller
{
    public function addPengaduan(Request $request)
    {
        try {
            $client = new Client();
            $response = $client->post('http://localhost:4000/pengaduan/addPengaduan', [
                'headers' => [
                    'Accept' => 'application/json',
                    'Content-Type' => 'application/json',
                ],
                'json' => $request->all(),
            ]);

            $result = json_decode($response->getBody(), true);

            if ($result['success']) {
                return response()->json(['success' => true, 'message' => $result['message']]);
            }

            return response()->json(['success' => false, 'error' => $result['error'] ?? 'Terjadi kesalahan.']);
        } catch (\Throwable $th) {
            return response()->json(['success' => false, 'error' => 'gagal menambahkan pengaduan: ' . $th->getMessage()]);
        }
    }
}
