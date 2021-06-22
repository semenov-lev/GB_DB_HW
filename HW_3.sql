USE vk;

DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist (
	id SERIAL,
	user_id BIGINT UNSIGNED DEFAULT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ALTER TABLE media 
-- DROP COLUMN IF EXISTS author;
-- С гуглом, не осилил. Как не переставляй - ругается на синтаксис. Подскажете, что я делаю не так?

ALTER TABLE media ADD COLUMN author VARCHAR(150);

DROP TABLE IF EXISTS audio;
CREATE TABLE audio (
	id SERIAL,
	playlist_id BIGINT UNSIGNED NULL,
	audio_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (playlist_id) REFERENCES playlist(id),
	FOREIGN KEY (audio_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS video_albums;
CREATE TABLE video_albums (
	id SERIAL,
	user_id BIGINT UNSIGNED DEFAULT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS video;
CREATE TABLE video (
	id SERIAL,
	video_album_id BIGINT UNSIGNED NULL,
	video_id BIGINT UNSIGNED NOT NULL,
	discription TEXT,
	/* Верно ли я понимаю, что если добавить описание в отдельную таблицу, то, несмотря на наличие столбца 'body' в
	таблице media, пользователь сам сможет давать описание к видео в своем альбоме? */
	
	FOREIGN KEY (video_album_id) REFERENCES video_albums(id),
	FOREIGN KEY (video_id) REFERENCES media(id)
	);

	/* С заданием я, конечно, прохалтурил, сделав две пары практически идентичных друг другу таблицы.
	Куда интереснее было бы организовать комментарии ко всем медиа, но мне не хватило времени */
