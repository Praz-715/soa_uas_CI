<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Mahasiswa extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mahasiswa_model', 'mahasiswa');
        $this->methods['index_get']['limit'] = 50;
    }
    // Kode program method GET
    public function index_get()
    {
        $nim = $this->get('nim');

        // If the nim parameter doesn't exist return all the mahasiswa

        if ($nim === NULL) {
            $mahasiswa = $this->db->get('mahasiswa')->result();
            // Check if the mahasiswa data store contains mahasiswa (in case the database result returns NULL)
            if ($mahasiswa) {
                // Set the response and exit
                $inilah = [];
                foreach ($mahasiswa as $datanya) {
                    $inilah[] = [
                        'nim' => $datanya->nim,
                        'detail' => [
                            'nama' => $datanya->nama,
                            'fakultas' => $datanya->fakultas,
                            'prodi' => $datanya->jurusan,
                            'periode_daftar' => $datanya->periode_daftar,
                            'biodata' => [
                                'jenis_kelamin' => $datanya->jk,
                                'email' => $datanya->email,
                                'hp' => $datanya->no_hp,
                                'alamat' => [
                                    'jalan' => $datanya->jalan,
                                    'RT/RW' => $datanya->rtrw,
                                    'kelurahan' => $datanya->kelurahan,
                                    'kecamatan' => $datanya->kecamatan,
                                    'kota' => $datanya->kota,
                                    'provinsi' => $datanya->provinsi,

                                ],
                                'kewarganegaraan' => $datanya->kewarganegaraan
                            ]
                        ]
                    ];
                }
                $this->response($inilah, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
            } else {
                // Set the response and exit
                $this->response([
                    'status' => FALSE,
                    'message' => 'No mahasiswa were found'
                ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
            }
        }

        // Find and return a single record for a particular user.
        else {
            $nim = (int) $nim;

            // Valnimate the nim.
            if ($nim <= 0) {
                // Invalnim nim, set the response and exit.
                $this->response(NULL, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
            }

            // Get the user from the array, using the nim as key for retrieval.
            // Usually a model is to be used for this.
            $this->db->where('nim', $nim);
            $mahasiswa = $this->db->get('mahasiswa')->result();
            $user = $mahasiswa;

            if (!empty($user)) {
                $inilah = [];
                foreach ($mahasiswa as $datanya) {
                    $inilah[] = [
                        'nim' => $datanya->nim,
                        'detail' => [
                            'nama' => $datanya->nama,
                            'fakultas' => $datanya->fakultas,
                            'prodi' => $datanya->jurusan,
                            'periode_daftar' => $datanya->periode_daftar,
                            'biodata' => [
                                'jenis_kelamin' => $datanya->jk,
                                'email' => $datanya->email,
                                'hp' => $datanya->no_hp,
                                'alamat' => [
                                    'jalan' => $datanya->jalan,
                                    'RT/RW' => $datanya->rtrw,
                                    'kelurahan' => $datanya->kelurahan,
                                    'kecamatan' => $datanya->kecamatan,
                                    'kota' => $datanya->kota,
                                    'provinsi' => $datanya->provinsi,

                                ],
                                'kewarganegaraan' => $datanya->kewarganegaraan
                            ]
                        ]
                    ];
                }
                $this->set_response($inilah, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
            } else {
                $this->set_response([
                    'status' => FALSE,
                    'message' => 'Mahasiswa could not be found'
                ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
            }
        }
    }

    public function index_delete()
    {
        $id = $this->delete('id');

        if ($id === null) {
            $this->response([
                'status' => false,
                'message' => 'provide an id!'
            ], 400);
        } else {
            if ($this->mahasiswa->deleteMahasiswa($id) > 0) {
                //ok
                $this->response([
                    'status' => true,
                    'id' => $id,
                    'message' => 'data mahasiswa has been deleted!'

                ], 204);
            } else {
                //id not found
                $this->response([
                    'status' => false,
                    'message' => 'id not found!'
                ], 400);
            }
        }
    }


    public function index_post()
    {
        $data = [
            'id' => $this->post('id', true),
            'nim' => $this->post('nim', true),
            'nama' => $this->post('nama', true),
            'email' => $this->post('email', true),
            'jurusan' => $this->post('jurusan', true)
        ];

        if ($this->mahasiswa->createMahasiswa($data) > 0) {
            //ok
            $this->response([
                'status' => true,
                'message' => 'new mahasiswa has been created.'
            ], 201);
        } else {
            //id not found
            $this->response([
                'status' => false,
                'message' => 'failed to create new data!'
            ], 400);
        }
    }

    public function index_put()
    {
        // kenapa dibedakan agar id masuk ke where
        $id = $this->put('id');
        $data = [
            'id' => $this->put('id', true),
            'nim' => $this->put('nim', true),
            'nama' => $this->put('nama', true),
            'email' => $this->put('email', true),
            'jurusan' => $this->put('jurusan', true)
        ];
        if ($this->mahasiswa->updateMahasiswa($data, $id) > 0) {
            $this->response([
                'status' => true,
                'message' => 'data mahasiswa has been updated.'
            ], 200);
        } else {
            //id not found
            $this->response([
                'status' => false,
                'message' => 'failed to update new data!'
            ], 400);
        }
    }
}
