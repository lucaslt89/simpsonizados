//
//  SeasonSelectorCollectionViewController.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/26/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit

class SeasonSelectorCollectionViewController: UICollectionViewController {

    private var selectedSeason : Int!
    private var seasons: [Season]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSeasons()
    }

    private func loadSeasons() {
        DatabaseManager.sharedInstance.insertUpdateSeasonWithNumber(1, chaptersCount: 13)

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 1",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 2",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 3",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 4",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 5",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 6",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 7",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 8",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 9",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 10",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 11",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 12",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        DatabaseManager.sharedInstance.insertUpdateChapterOfSeason(1,
            name: "Especial de Navidad 13",
            chapterDescription: "La navidad está a punto de arruinarse, ya que Marge debe gastar todo el dinero destinado a los obsequios de la familia, para quitar el tatuaje a Bart. Además, Burns decide no darle a sus empleados un bono de navidad, por lo que Homero debe conseguir un trabajo de Santa Claus en el centro comercial, pero termina apostando dinero en el galgódromo, en donde conocen a Ayudante de Santa.",
            imageURL: "https://www.simpsonizados.org/api/imagen.php?src=https://image.tmdb.org/t/p/original/jjlphZcLqJxaBmgtTQizRYVE5rH.jpg&w=150&h=85&zc=1",
            latinoURL: "https://r8---sn-x1x7snee.googlevideo.com/videoplayback?id=8b45cfa4bef600a2&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7snee&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444276527313003&mt=1453230104&ip=181.165.189.64&ipbits=8&expire=1453258996&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=8D3100EC14A2ABB4A8D569923D8A66B205DDB4F4.8DD4F7619A991D9CA48AA4379A91E1F3B469F71F&key=ck2",
            spanishURL: "https://r15---sn-x1x7sn7y.googlevideo.com/videoplayback?id=3823c3086ce1f85d&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7y&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1444696387496728&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259047&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=B96223D5A918A0D516816EEC6975E0AD7A066B0A.7261AEED73FAF87B304744C706DF7CF73B410D3F&key=ck2",
            englishURL: "https://r9---sn-x1x7sn7k.googlevideo.com/videoplayback?id=b55cbc55a6960b4f&itag=18&source=webdrive&begin=0&requiressl=yes&mm=30&mn=sn-x1x7sn7k&ms=nxu&mv=m&pl=20&mime=video/mp4&lmt=1448517085247106&mt=1453230209&ip=181.165.189.64&ipbits=8&expire=1453259138&sparams=ip,ipbits,expire,id,itag,source,requiressl,mm,mn,ms,mv,pl,mime,lmt&signature=51573339DF9D4620DAA70ED18F0FB39D94D1973E.5D50491D88E67769197C07EE92CDC4666CE4C96D&key=ck2&ir=1&rr=12")

        seasons = DatabaseManager.sharedInstance.retrieveSeasons()
    }

    // MARK: - UICollectionViewDataSource -

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasons.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SeasonCollectionViewCellIdentifier, forIndexPath: indexPath) as! SeasonCollectionViewCell

        let seasonNumber = indexPath.row + 1
        cell.seasonImage.image = UIImage(named: "season" + "\(seasonNumber)")
        cell.seasonLabel.text = seasons[indexPath.row].seasonName

        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedSeason = indexPath.row + 1
        performSegueWithIdentifier(ShowSeasonViewControllerSegueIdentifier, sender: nil)
    }

    override func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    // MARK: - Navigation methods -

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! SeasonViewController
        destinationVC.season = selectedSeason
        destinationVC.title = "Season " + "\(selectedSeason)"
    }

}
