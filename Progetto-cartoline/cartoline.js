$(document).ready(function(){
    /* FUNZIONE CHE AL CLICK SULL'IMMAGINE "ILLUMINA" LA PORZIONE DI TESTO RELATIVA */
    /* CONTROLLANDO SE LA PARTE SELEZIONATA è GIà EVIDENZIATA O NO ATTRAVERSO GLI ATTRIBUTI background-color e border */
    $('.line').click(function(){
        var id = $(this).attr('id');
        if($(this).css('background-color')== 'rgba(0, 0, 0, 0)' ){
            $('.line').css('background-color', 'rgba(0,0,0,0)');
            $('.line').css('border', '0px');
            $('.testo').css('border', '0px');
            $('.testo').css('background-color', 'rgba(0,0,0,0)');
            $(this).css('background-color', 'rgba(254, 153, 1, 0.5)');
            $(this).css('border', '1px solid black');
            $('p[id$='.concat(id, ']')).css('border', '1px solid black');
            $('p[id$='.concat(id, ']')).css('background-color', 'rgba(254, 153, 1, 0.5)');
        } else {
            $(this).css('background-color', 'rgba(0,0,0,0)');
            $(this).css('border', '0px');
            $('p[id$='.concat(id, ']')).css('border', '0px');
            $('p[id$='.concat(id, ']')).css('background-color', 'rgba(0,0,0,0)');
        }
    });    
     /* FUNZIONE CHE AL CLICK SUL TESTO "ILLUMINA" LA PORZIONE DI IMMAGINE RELATIVA */
    /* CONTROLLANDO SE LA PARTE SELEZIONATA è GIà EVIDENZIATA O NO ATTRAVERSO GLI ATTRIBUTI background-color e border */
    $('.testo').click(function(){
        var id = $(this).attr('id');
        id = id.substring(1,id.length);
        if($(this).css('border')=='0px none rgb(0, 0, 0)'){
            $('.testo').css('border', '0px');
            $('.testo').css('background-color', 'rgba(0,0,0,0)');
            $('.line').css('background-color', 'rgba(0,0,0,0)');
            $('.line').css('border', '0px');
            $(this).css('background-color', 'rgba(254, 153, 1, 0.5)');
            $(this).css('border', '1px solid black');
            $('div[id$='.concat(id, ']')).css('background-color', 'rgba(254, 153, 1, 0.5)');
            $('div[id$='.concat(id, ']')).css('border', '1px solid black');
        } else {
            $(this).css('background-color', 'rgba(0,0,0,0)');
            $(this).css('border', '0');
            $('div[id$='.concat(id, ']')).css('background-color', 'transparent');
            $('div[id$='.concat(id, ']')).css('border', '0px');
        }
    }); 
})