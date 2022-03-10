<?php echo $this->extend('_common/layout') ?>
<?php echo $this->section('content') ?>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><?php echo anchor('', "Home") ?></li>
        <li class="breadcrumb-item active" aria-current="page">Orcamentos</li>
    </ol>
</nav>
<div class="card">
    <div class="card-header">
        Orcamentos
    </div>
    <div class="card-body">
        COnteudo
    </div>
</div>

<?php echo $this->endSection('content') ?>