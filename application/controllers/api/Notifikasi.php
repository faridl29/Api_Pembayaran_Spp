<?php

defined('BASEPATH') OR exit('No direct script allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Notifikasi extends REST_Controller {

    public function __construct($config = 'rest')
	{
		parent::__construct();
		$this->load->database();
		$this->load->model('User_model');
		$this->load->helper('waktu');
	}

	public function index_post(){
        $nisn = $this->post('nisn');
        $token = $this->post('token');

        $this->User_model->token_existed($token);
   
        $this->User_model->simpanToken($nisn, $token);
            
	
	}

	public function index_get(){
		$nisn = $this->get('nisn');

		$this->db->where('nisn', $nisn);
		$this->db->order_by('waktu', 'DESC');
		$notifikasi = $this->db->get('notifikasi')->result();

		foreach($notifikasi as $row){
			$row->waktu = waktu_lalu($row->waktu);	
		}
		
		
		$this->response(array("result"=>$notifikasi,200));	
	}

	public function clicked_post(){
		$id = $this->post('id');

		$data = array('isClicked' => "1");
        $this->db->where('id', $id);
        $this->db->update('notifikasi', $data);

	}

	public function badge_get(){
		$nisn = $this->get('nisn');

		$this->db->where('nisn', $nisn);
		$this->db->where('isClicked' ,'0');
		$notifikasi = $this->db->get('notifikasi')->result();
		
		$this->response(array("result"=>$notifikasi,200));	
	}

	public function index_delete(){
		$nisn = $this->delete('nisn');
		$this->db->where('nisn', $nisn);
		$this->db->delete('notifikasi');

	}


}