//
//  HTMLParser.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/21/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit
import Kanna

class HTMLParser: NSObject {

    class func parseURL(url: NSURL) {

        do {
            let myHTMLString = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
            if let doc = Kanna.HTML(html: myHTMLString, encoding: NSUTF8StringEncoding) {

                var season = url.absoluteString.characters.split("-").map(String.init)[2]
                season = season.characters.split(".").map(String.init)[0]

                // Search for Chapter titles
                var chapterTitles = Array<String>()
                for chapter in doc.css("h3") {
                    let partsArray = chapter.text!.characters.split("\"").map(String.init)
                    chapterTitles.append(partsArray[1])
                }

                //Search for descriptions
                var chapterDescriptions = Array<String>()
                for description in doc.css("p[class~=\"desc\"]") {
                    chapterDescriptions.append(description.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
                }

                //Search for image urls
                var imagesURLs = Array<String>()
                for smallImageURL in doc.css("img[src^=\"https://www.simpsonizados.org/api/\"]") {
                    var bigImageURL : String = smallImageURL["src"]!
                    bigImageURL = bigImageURL.stringByReplacingOccurrencesOfString("https://www.simpsonizados.org/api/imagen.php?src=", withString: "")
                    bigImageURL = bigImageURL.stringByReplacingOccurrencesOfString("150&h=85", withString: "200&h=110")
                    imagesURLs.append(bigImageURL)
                }

                for chapterIndex in 0..<chapterTitles.count {
                    print(season + "|" + chapterTitles[chapterIndex] + "|" + chapterDescriptions[chapterIndex] + "|_____________________|||" + imagesURLs[chapterIndex])
                }

            }
        } catch _ {

        }
    }

}


//<!DOCTYPE html>
//<html class="no-js" lang="es">
//<head>
//<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
//<link rel="shortcut icon" href="https://www.simpsonizados.org/favicon.ico" />
//<title>Temporada 5 de Los Simpsons en HD</title>
//<meta name="description" content="Mira capitulos de Los Simpsons online audio latino y también en español de España. Episodios de los simpsons online audio latino a todo momento y en todo lugar lugar videos online, videos de los simpsons temporada 27"/>
//<meta property="og:image" content="https://www.simpsonizados.org/cdn/img/simpsonizados.jpg" />
//<meta name="keywords" content="simpsons, capitulos, episodios de los simpsons, los simpsons online, simpsons online, capitulos de los simpsons, descargar capitulos de los simpsons, los simpsons españa, simpsons audio latino, simpsons español, simpsons argentina" />
//<meta property="og:title" content="Temporada 5 de Los Simpsons en HD">
//<link rel="canonical" href="https://www.simpsonizados.org/simpsons-temporada-5.html" />
//<meta property="fb:app_id" content="1688650581366313"/>
//<meta property="og:title" content="Temporada 5 de Los Simpsons en HD" />
//<meta property="og:type" content="activity" />
//<meta property="og:url" content="https://www.simpsonizados.org/simpsons-temporada-5.html" />
//<meta property="og:image" content="https://www.simpsonizados.org/cdn/img/simpsonizados.jpg" />
//<meta property="og:site_name" content="Temporada 5 de Los Simpsons en HD" />
//<meta property="og:description" content="Mira capitulos de Los Simpsons online audio latino y también en español de España. Episodios de los simpsons online audio latino a todo momento y en todo lugar lugar videos online, videos de los simpsons temporada 27" />
//<meta content="Mira capitulos de Los Simpsons online audio latino y también en español de España. Episodios de los simpsons online audio latino a todo momento y en todo lugar lugar videos online, videos de los simpsons temporada 27" name="description"/>
//<meta property="fbid" content="441325056074437"/>
//<meta property="og:site_name" content="Simpsonizados.org" />
//<meta name="rating" content="General" />
//<meta name="revisit-after" content="15 days">
//<meta content='index,follow' name='robots' />
//
//<!-- Móviles -->
//<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
//<script src="https://www.simpsonizados.org/cdn/js/jquery.js" type="text/javascript"></script>
//
//<!-- Estilos -->
//<link rel="stylesheet" href="https://www.simpsonizados.org/cdn/css/normalize.css" />
//<link rel="stylesheet" href="https://www.simpsonizados.org/cdn/css/main.css" />
//
//<!--[if lt IE 9]>
//<script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
//<![endif]-->
//<link href='https://fonts.googleapis.com/css?family=Titillium+Web:900' rel='stylesheet' type='text/css'>
//</head>
//<body>
//<div class="outer">
//<div class="header">
//<a href="/"><h1 class="logo">Simpsonizados.org - Los Simpsons Online</h1></a>
//<nav>
//<ul class="nav">
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-1.html" title="Los Simpsons Online Temporada 1">1</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-2.html" title="Los Simpsons Online Temporada 2">2</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-3.html" title="Los Simpsons Online Temporada 3">3</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-4.html" title="Los Simpsons Online Temporada 4">4</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-5.html" title="Los Simpsons Online Temporada 5">5</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-6.html" title="Los Simpsons Online Temporada 6">6</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-7.html" title="Los Simpsons Online Temporada 7">7</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-8.html" title="Los Simpsons Online Temporada 8">8</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-9.html" title="Los Simpsons Online Temporada 9">9</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-10.html" title="Los Simpsons Online Temporada 10">10</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-11.html" title="Los Simpsons Online Temporada 11">11</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-12.html" title="Los Simpsons Online Temporada 12">12</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-13.html" title="Los Simpsons Online Temporada 13">13</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-14.html" title="Los Simpsons Online Temporada 14">14</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-15.html" title="Los Simpsons Online Temporada 15">15</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-16.html" title="Los Simpsons Online Temporada 16">16</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-17.html" title="Los Simpsons Online Temporada 17">17</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-18.html" title="Los Simpsons Online Temporada 18">18</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-19.html" title="Los Simpsons Online Temporada 19">19</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-20.html" title="Los Simpsons Online Temporada 20">20</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-21.html" title="Los Simpsons Online Temporada 21">21</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-22.html" title="Los Simpsons Online Temporada 22">22</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-23.html" title="Los Simpsons Online Temporada 23">23</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-24.html" title="Los Simpsons Online Temporada 24">24</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-25.html" title="Los Simpsons Online Temporada 25">25</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-26.html" title="Los Simpsons Online Temporada 26">26</a></li>
//<li><a href="https://www.simpsonizados.org/simpsons-temporada-27.html" title="Los Simpsons Online Temporada 27">27</a></li>
//<li class="random"><a href="https://www.simpsonizados.org/random"><img src="/cdn/img/random.png"></a></li>
//<form method="GET" action="https://www.simpsonizados.org/buscar/" accept-charset="UTF-8"><li class="buscador"><input type="text" placeholder="Buscar..." name="s" /></li>
//</form></ul>
//</nav>
//</div>
//<br>
//<div class="contenedor">
//<div class="main">
//
//
//<h2 class="tit"><span>Temporada 5 :</span></h2>
//<div class="capitulo">
//<h3>5x1: "El Cuarteto de Homero"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/81opatCTqNbbVxJYqo6pX2YFQmI.jpg&w=150&h=85&zc=1" alt="El Cuarteto de Homero">
//</a>
//<p class="desc">Vemos lo que sucedía en 1985, cuando Homero, Apu, el director Skinner y el jefe Gorgori (reemplazado por Barney) formaban un cuarteto de barbería exitoso. Estrella invitada: George Harrison, Dan Jordan, George Economou, James Campbell y Shelby Grimm.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x1-el-cuarteto-de-homero.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x1-el-cuarteto-de-homero.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x2: "Cabo de miedosos"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/yEbaUHy8WlYZmfw85d5j6S97xCi.jpg&w=150&h=85&zc=1" alt="Cabo de miedosos">
//</a>
//<p class="desc">Bob Patiño sale de prisión y su único objetivo esta vez es acabar con la vida de Bart. Para proteger su existencia, la familia se muda y se cambia el apellido a Thompson.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x2-cabo-de-miedosos.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x2-cabo-de-miedosos.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x3: "Homero va a la universidad"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/pLhgFURqgVdd7eGRpUHZ6ynhjnu.jpg&w=150&h=85&zc=1" alt="Homero va a la universidad">
//</a>
//<p class="desc">Para conservar su puesto de trabajo en la Planta Nuclear, Homero necesita tener un titulo universitario, así que empieza a asistir a las clases y allí conoce a tres nerds que le ayudan a aprobar mientras Homero les ayuda a ellos a ser expulsados de la universidad.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x3-homero-va-a-la-universidad.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x3-homero-va-a-la-universidad.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x4: "El oso de Burns"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/2HCHSB6DwEhjdru2iIFCrMtS71J.jpg&w=150&h=85&zc=1" alt="El oso de Burns">
//</a>
//<p class="desc">Cuando el Señor Burns era joven, dejó a su oso de peluche Bobo por una vida de millonario. Ahora quiere a su oso de vuelta, y el problema es que Maggie también. Estrellas invitadas: The Ramones.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x4-el-oso-de-burns.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x4-el-oso-de-burns.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x5: "Especial de noche de brujas IV"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/b4bU7miPe8UpqryACLIzlxYxH5n.jpg&w=150&h=85&zc=1" alt="Especial de noche de brujas IV">
//</a>
//<p class="desc">Bart presenta tres historias de horror, ilustradas por cuadros.
//
//- El diablo y Homero Simpson: Homero entrega su alma por una rosquilla y ahora, el diablo la quiere.
//
//- El terror a 5 1/2 pies: Bart tiene una pesadilla sobre un choque con el micro de la escuela. Y su pesadilla está por hacerse realidad cuando ve a un gremlin sacar cada pieza del micro.
//
//- Dracula: Bart Simpson: Burns es un vampiro, quiere sangre, y convierte a Bart en vampiro también.</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x5-especial-de-noche-de-brujas-iv.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x5-especial-de-noche-de-brujas-iv.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x6: "Marge la rebelde"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/nBKjCp1WXdiqTymz0EKfLwbL09N.jpg&w=150&h=85&zc=1" alt="Marge la rebelde">
//</a>
//<p class="desc">Cuando Homero no puede acompañarla al ballet, Marge va con su vecina Ruth. Ruth le devuelve el favor y la saca la noche siguiente. Pero lo que Marge no sabe es que el auto de Ruth es robado. Estrella invitada: Pamela Reed y George Feneman.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x6-marge-la-rebelde.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x6-marge-la-rebelde.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x7: "Filosofía Bartiana"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/c9i60m6zux4l56vqmJZJIMx2sWu.jpg&w=150&h=85&zc=1" alt="Filosofía Bartiana">
//</a>
//<p class="desc">Marge se da cuenta de que no es divertida por regañar continuamente y busca ayuda de un gurú llamado Brad Goodman, quien luego utiliza la actitud irreverente de Bart como un nuevo ejemplo de cómo debería comportarse la gente. Todos los ciudadanos de Springfield comienzan a actuar como Bart, quien al principio lo disfruta pero luego siente que había perdido su identidad. Durante el festival inaugural 'Haga lo que se le antoje', todo sale mal y los habitantes de la ciudad deciden dejar de actuar como Bart.</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x7-filosofia-bartiana.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x7-filosofia-bartiana.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x8: "Exploradores a fuerza"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/no5gL2bs95k03UpHiajmlti9scd.jpg&w=150&h=85&zc=1" alt="Exploradores a fuerza">
//</a>
//<p class="desc">Cuando Bart encuentra $ 20, los gasta en una malteada, hecha puramente con jarabe. Después de una noche agitada, se despierta y se da cuenta que se unió a un grupo de boy scouts dirigido por Ned Flanders. Estrella invitada: Ernest Borgnine.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x8-exploradores-a-fuerza.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x8-exploradores-a-fuerza.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x9: "La ultima tentacion de Homero"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/575zG67s8nAgPyQ6ijoFhpzAPLX.jpg&w=150&h=85&zc=1" alt="La ultima tentacion de Homero">
//</a>
//<p class="desc">Homero se enamora de una nueva compañera de trabajo que es igual que él. Pero se siente culpable. Mientras, Bart sufre de varios tratamientos médicos a la vez. Estrellas invitadas: Michelle Pfeiffer y Werner Klemperer.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x9-la-ultima-tentacion-de-homero.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x9-la-ultima-tentacion-de-homero.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x10: "Springfield prospero o el problema del juego"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/3nqrJSe6fu5p4ScUcKlcfVcajdd.jpg&w=150&h=85&zc=1" alt="Springfield prospero o el problema del juego">
//</a>
//<p class="desc">Para solucionar una crisis económica en Springfield, se legaliza el juego. Burns abre un casino, en el que Homero es croupier de blackjack y Marge se hace adicta a las máquinas tragamonedas. Estrellas invitadas: Gerry Cooney y Robert Goulet.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x10-springfield-prospero-o-el-problema-del-juego.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x10-springfield-prospero-o-el-problema-del-juego.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x11: "Homero detective"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/5QRssXk0j3xDcSWloKi6VJNjXQA.jpg&w=150&h=85&zc=1" alt="Homero detective">
//</a>
//<p class="desc">Una ola de pequeños robos pone en alerta a los ciudadanos de Sprinfield, que deciden poner fin a la situación formando una patrulla de barrio encabezada por Homero. Estrella invitada: Sam Neill.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x11-homero-detective.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x11-homero-detective.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x12: "Bart se hace famoso"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/uGrKr1cGKkxtc9HjzOTFMU3F822.jpg&w=150&h=85&zc=1" alt="Bart se hace famoso">
//</a>
//<p class="desc">Después de escaparse de una excursión a una fábrica de cajas, Bart se mete en el estudio de Krusty, y se convierte en su asistente. Pero cuando accidentalmente tira abajo un decorado y dice 'Yo no fui' se convierte en una celebridad. Estrella invitada: Conan O'Brien (ex guionista y productor de Los Simpsons).
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x12-bart-se-hace-famoso.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x12-bart-se-hace-famoso.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x13: "Homero y Apu"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/vxoCXKPWBCz7hbLAGiHOzNWEdIH.jpg&w=150&h=85&zc=1" alt="Homero y Apu">
//</a>
//<p class="desc">Cuando es envenenado por comida del Kwik-E-Mart de Apu, Homero consigue que sea despedido. Pero se arrepiente y lo ayuda a conseguir su trabajo de vuelta. Estrella invitada: James Woods.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x13-homero-y-apu.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x13-homero-y-apu.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x14: "Lisa contra la Stacy Malibu"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/vRJ1z7QiM6UA4gwji7kyNxKAMGa.jpg&w=150&h=85&zc=1" alt="Lisa contra la Stacy Malibu">
//</a>
//<p class="desc">Después de ver lo que dice la nueva muñeca Stacy Malibu que habla, Lisa encuentra a la creadora y juntas hacen una muñeca con frases no sexistas. Estrella invitada: Kathleen Turner.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x14-lisa-contra-la-stacy-malibu.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x14-lisa-contra-la-stacy-malibu.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x15: "Homero en el espacio profundo"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/5T4GgsBk8iwIHIVVouw8NTbUkP6.jpg&w=150&h=85&zc=1" alt="Homero en el espacio profundo">
//</a>
//<p class="desc">Después de ver que sus ratings están muy bajos, la NASA decide mandar al espacio a un hombre común. Ese hombre común es Homero Simpson. Estrellas invitadas: James Taylor y Buzz Aldrin.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x15-homero-en-el-espacio-profundo.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x15-homero-en-el-espacio-profundo.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x16: "Homero ama a Flanders"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/1NbyuyEnV1v59F972xdy3LX4mnD.jpg&w=150&h=85&zc=1" alt="Homero ama a Flanders">
//</a>
//<p class="desc">Después de que Ned Flanders le da a Homero una entrada para el partido de fútbol americano que quiere ver, Homero se convierte en el mejor amigo de Flanders.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x16-homero-ama-a-flanders.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x16-homero-ama-a-flanders.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x17: "Bart gana un elefante"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/7bXPNldsxLIFRPabGoRTkqqngCu.jpg&w=150&h=85&zc=1" alt="Bart gana un elefante">
//</a>
//<p class="desc">Cuando Bart gana el concurso 'KBBL me va a dar algo estúpido', Bart rechaza $ 10.000 en efectivo por un elefante. Pero el elefante causa algunos problemas mayores.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x17-bart-gana-un-elefante.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x17-bart-gana-un-elefante.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x18: "El heredero de Burns"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/tEWDrqqdsUyOwRSIqB0mVVfYF2J.jpg&w=150&h=85&zc=1" alt="El heredero de Burns">
//</a>
//<p class="desc">Cuando Burns tiene un encuentro cercano con la muerte, decide encontrar un heredero. Bart es el elegido y Burns trata de convencerlo para que viva con él.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x18-el-heredero-de-burns.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x18-el-heredero-de-burns.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x19: "La cancion de Skinner"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jeW31WEMuITT67PjSa2AMj0Ykia.jpg&w=150&h=85&zc=1" alt="La cancion de Skinner">
//</a>
//<p class="desc">Bart lleva al perro de la familia a la escuela, pero el perro se escapa e indirectamente causa que Skinner sea despedido. La vida en la escuela con Flanders como director no es lo mismo y Bart trata de hacer que Skinner vuelva a su antiguo puesto.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x19-la-cancion-de-skinner.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x19-la-cancion-de-skinner.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x20: "El nino que sabia demasiado"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/c5YbUNjiZf1Z2ZCktgHTaXg4gHS.jpg&w=150&h=85&zc=1" alt="El nino que sabia demasiado">
//</a>
//<p class="desc">Bart se escapa de la escuela y ve a un mozo lesionarse seriamente. Cuando es sobrino del alcalde es acusado de golpearlo, sólo Bart sabe que es inocente. Pero revelar eso significaría reconocer que se escapó de la escuela.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x20-el-nino-que-sabia-demasiado.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x20-el-nino-que-sabia-demasiado.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x21: "El amante de Jackie Bouvier"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/5TpFEh7RngYPopJYDtZLRxHJQTn.jpg&w=150&h=85&zc=1" alt="El amante de Jackie Bouvier">
//</a>
//<p class="desc">El Abuelo se enamora de la madre de Marge, Jackie Bouvier, pero el Señor Burns se la saca. Al Abuelo se le rompe el corazón cuando se entera de que Jackie se va a casar con Burns.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x21-el-amante-de-jackie-bouvier.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x21-el-amante-de-jackie-bouvier.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<div class="capitulo">
//<h3>5x22: "Secretos de un buen matrimonio"</h3>
//<img src="https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/1xhuHdnj1BnO1ZN7w85ZnvhpmhH.jpg&w=150&h=85&zc=1" alt="Secretos de un buen matrimonio">
//</a>
//<p class="desc">Preocupado por ser lento, Homero decide dar un curso de Cómo Tener un Buen Matrimonio. Pero no tiene éxito como maestro hasta que empieza a contar intimidades de Marge.
//
//</p>
//<div class="idiomas">
//<a href="https://www.simpsonizados.org/simpsons-5x22-secretos-de-un-buen-matrimonio.html" class="boton">Audio Latino</a>
//<a href="https://www.simpsonizados.org/simpsons-esp-5x22-secretos-de-un-buen-matrimonio.html" class="boton">Audio Español</a>
//</div>
//<br class="clear">
//</div>
//<br class="clear">
//</div>
//<div class="side">
//<div class="ad300">
//</div>
//<div class="widget">
//<iframe src="https://www.facebook.com/plugins/likebox.php?id=441325056074437&amp;width=300&amp;connections=10&amp;stream=true&amp;header=false&amp;height=555" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:300px; height:555px;" allowTransparency="true"></iframe>
//</div>
//<div class="ad300">
//</div>
//<br class="clear">
//</div>
//<br class="clear">
//</div>
//<br class="clear">
//<div class="footer">
//<center><p>Simpsonizados.org - Podrán imitarnos, pero igualarnos jamás</p></center>
//</div>
//</div>
//<div style="display:none;">
//
//</div>
//
//
//<div class="nubes" id="nubes"></div>
//<!-- JavaScript -->
//<script src="/cdn/js/jquery.js"></script>
//<script src="/cdn/js/nubes.js"></script>
//<script>
//$(function(){
//crearNubes();
//var intervalo = window.setInterval(function(){crearNube()}, 7500);
//$('.capitulo').mouseenter(function(){
//$(this).addClass('capselect');
//});
//$('.capitulo a').focus(function(){
//$(this).parent().addClass('capselect');
//});
//$('.capitulo a').blur(function(){
//$(this).parent().removeClass('capselect');
//});
//$('.capitulo').mouseleave(function(){
//$(this).removeClass('capselect');
//});
//});
//</script>
//<div id="fb-root"></div>
//<script>(function(d, s, id) {
//var js, fjs = d.getElementsByTagName(s)[0];
//if (d.getElementById(id)) return;
//js = d.createElement(s); js.id = id;
//js.src = "https://connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.5&appId=1688650581366313";
//fjs.parentNode.insertBefore(js, fjs);
//}(document, 'script', 'facebook-jssdk'));</script>
//<script>
//(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
//(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
//m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
//})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
//
//ga('create', 'UA-69292217-1', 'auto');
//ga('send', 'pageview');
//
//</script>
//</html>