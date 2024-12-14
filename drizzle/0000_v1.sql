CREATE TABLE `mentor` (
	`id` int NOT NULL,
	`firstName` text NOT NULL,
	`lastName` text NOT NULL,
	`email` text NOT NULL,
	`role` int NOT NULL,
	`roleOverride` int NOT NULL,
	`isVisitor` boolean NOT NULL,
	`rating` int NOT NULL,
	`mentorAvailability` text,
	`allowedSessionTypes` text,
	`timezone` text,
	CONSTRAINT `mentor_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `sessionType` (
	`id` varchar(21) NOT NULL,
	`name` text NOT NULL,
	`category` text NOT NULL,
	`length` int NOT NULL,
	`rating` int NOT NULL,
	CONSTRAINT `sessionType_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `session` (
	`id` varchar(21) NOT NULL,
	`mentor` int NOT NULL,
	`student` int NOT NULL,
	`type` varchar(21) NOT NULL,
	`start` text NOT NULL,
	`reminded` boolean NOT NULL DEFAULT false,
	`timezone` text NOT NULL,
	CONSTRAINT `session_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `student` (
	`id` int NOT NULL,
	`firstName` text NOT NULL,
	`lastName` text NOT NULL,
	`email` text NOT NULL,
	`role` int NOT NULL,
	`roleOverride` int NOT NULL,
	`isVisitor` boolean NOT NULL,
	`rating` int NOT NULL,
	`mentorAvailability` text,
	`allowedSessionTypes` text,
	`timezone` text,
	CONSTRAINT `student_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `userToken` (
	`id` varchar(21) NOT NULL,
	`user` int NOT NULL,
	CONSTRAINT `userToken_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `user` (
	`id` int NOT NULL,
	`firstName` text NOT NULL,
	`lastName` text NOT NULL,
	`email` text NOT NULL,
	`role` int NOT NULL,
	`roleOverride` int NOT NULL,
	`isVisitor` boolean NOT NULL,
	`rating` int NOT NULL,
	`mentorAvailability` text,
	`allowedSessionTypes` text,
	`timezone` text,
	CONSTRAINT `user_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
ALTER TABLE `session` ADD CONSTRAINT `session_mentor_user_id_fk` FOREIGN KEY (`mentor`) REFERENCES `user`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `session` ADD CONSTRAINT `session_student_user_id_fk` FOREIGN KEY (`student`) REFERENCES `user`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `session` ADD CONSTRAINT `session_type_sessionType_id_fk` FOREIGN KEY (`type`) REFERENCES `sessionType`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `userToken` ADD CONSTRAINT `userToken_user_user_id_fk` FOREIGN KEY (`user`) REFERENCES `user`(`id`) ON DELETE no action ON UPDATE no action;