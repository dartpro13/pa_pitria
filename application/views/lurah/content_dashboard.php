<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

?>
<div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Penduduk</span>
              <div class="count"><?= $jumlah_penduduk;?></div>
              <span class="count_bottom"><i class="green">4% </i> From last Year</span>
            </div>
<!--
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> Average Time</span>
              <div class="count">123.50</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
-->
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Laki-Laki</span>
              <div class="count green"><?= $jumlah_pria;?></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Perempuan</span>
              <div class="count"><?= $jumlah_wanita;?></div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Surat Terbuat</span>
              <div class="count"><?= $total_surat;?></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Permohonan Srt</span>
              <div class="count"><?= $total_surat;?></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
          </div>
    <a target="_SELF"href="<?=base_url()?>index.php/lurah/doprint_laporan_penduduk/"><button type="button"class="btn btn-default btn-sm">Print Data Penduduk</button></a>
    <a target="_SELF"href="<?=base_url()?>index.php/lurah/doprint_laporan_skp/"><button type="button"class="btn btn-default btn-sm">Print Data Surat Pindah</button></a>
    <a target="_SELF"href="<?=base_url()?>index.php/lurah/doprint_laporan_skktp/"><button type="button"class="btn btn-default btn-sm">Print Data Surat Keterangan KTP</button></a>
    <a target="_SELF"href="<?=base_url()?>index.php/lurah/doprint_laporan_skkk/"><button type="button"class="btn btn-default btn-sm">Print Data Surat Keterangan KK</button></a>
    <a target="_SELF"href="<?=base_url()?>index.php/lurah/doprint_laporan_skl/"><button type="button"class="btn btn-default btn-sm">Print Data Surat Kelahiran</button></a>
    <a target="_SELF"href="<?=base_url()?>index.php/lurah/doprint_laporan_skm/"><button type="button"class="btn btn-default btn-sm">Print Data Surat Kematian</button></a>
          <!-- /top tiles -->
     <div >
            <canvas id="myChart" style="max-height:500px;"></canvas>
        </div>
        <script>
            var ctx = document.getElementById("myChart");
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ["Total Penduduk", "Laki-Laki", "Perempuan", "Total Surat Terbuat", "Total Permohonan"],
                    datasets: [{
                            label: 'Overview',
                            data: [<?= $jumlah_penduduk;?>, 
                                   <?= $jumlah_pria;?>,
                                   <?= $jumlah_wanita;?>, 
                                   <?= $total_surat;?>, 
                                   <?= $total_surat;?>],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255,99,132,1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>
        </div>
