<?php

defined('BASEPATH') OR exit('No direct script allowed');

$ci = get_instance();
$ci->load->helper('tgl_indo');
$ci->load->helper('rupiah');

class Tagihan_model extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	public function get_tagihan_tahunan($nisn){
		$this->db->select('tagihan.id, tagihan.tahun_ajaran, CONCAT("Rp ",FORMAT(tagihan.tagihan,0,"de_DE")) as tagihan, CONCAT("Rp ",FORMAT((spp.nominal * 12 - tagihan.tagihan),0,"de_DE")) as dibayar, tagihan.status_tagihan as status');
        $this->db->join('spp', 'spp.id_spp = tagihan.id_spp');
        $this->db->where('nisn', $nisn);
		$data = $this->db->get('tagihan')->result();

		return $data;
	}
    
    public function get_tagihan($nisn){
		$this->db->select('spp.nominal * count(tagihan) * 12 - sum(tagihan) as dibayar');
		$this->db->select_sum('tagihan');
		$this->db->where('nisn', $nisn);
		$this->db->join('spp', 'spp.id_spp = tagihan.id_spp');
		$query = $this->db->get('tagihan')->row_array();
		
		return $query;
	}

	public function get_tagihan_bulanan($id){

        $bulan = array(
            "Juli"             =>  "Juli",
            "Agustus"          =>  "Agustus",
            "September"        =>  "September",
            "Oktober"          =>  "Oktober",
            "November"         =>  "November",
            "Desember"         =>  "Desember",
            "Januari"          =>  "Januari",
            "Februari"         =>  "Februari",
            "Maret"            =>  "Maret",
            "April"            =>  "April",
            "Mei"              =>  "Mei",
            "Juni"             =>  "Juni"
        );

        $bulan_dibayar = array_values($bulan);
        $nama_petugas = array();
        $tgl_bayar = array();
        $tagihan_bulanan = array();

        $this->db->from('pembayaran');
        $this->db->where('id_tagihan', $id);
        $this->db->join('spp' , 'spp.id_spp = pembayaran.id_spp');
        $query = $this->db->get();
        $hasil2 = $query->row_array();

        $tagihan_spp = $hasil2['nominal'];
        
        $i= 0;
        foreach($bulan as $row){
            
            $this->db->from('pembayaran');
            $this->db->where('id_tagihan', $id);
            $this->db->where('bulan_dibayar', $bulan_dibayar[$i]);
			$this->db->join('petugas' , 'petugas.id_petugas = pembayaran.id_petugas');
			$this->db->join('spp' , 'spp.id_spp = pembayaran.id_spp');
            $query = $this->db->get();
            $hasil = $query->num_rows();
            $hasil2 = $query->row_array();
            if($hasil < 1){
                $nama_petugas[$i] = "";
                $tgl_bayar[$i] = "";
                $tagihan_bulanan[$i] = $tagihan_spp;
            }else{
                $nama_petugas[$i] = $hasil2['nama_petugas'];
                $tgl_bayar[$i] = date_indo($hasil2['tgl_bayar']);
                $tagihan_bulanan[$i] = "Lunas";
			}

			// if($bulan_dibayar[$i] == "Juli" || $bulan_dibayar[$i] == "Agustus" || $bulan_dibayar[$i] == "September" || $bulan_dibayar[$i] == "Oktober" || $bulan_dibayar[$i] == "November" || $bulan_dibayar[$i] == "Desember"){
			// 	$bulan_dibayar[$i] = $bulan_dibayar[$i]." ".substr($hasil2['tahun_ajaran'],0,4);
			// }else{
			// 	$bulan_dibayar[$i] = $bulan_dibayar[$i]." ".substr($hasil2['tahun_ajaran'],5,9);
			// }

			$tagihan[] = array(
				"Bulan" => $bulan_dibayar[$i], 
				"Petugas" => $nama_petugas[$i], 
				"tgl_bayar" => $tgl_bayar[$i], 
				"tagihan_bulanan" => rupiah(intval($tagihan_bulanan[$i]))
				);
			$i++;		
        }

        return $tagihan;
	}

}