package friends;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FriendsVo {

	private int friendsno;
	private int my_userno;
	private int friends_userno;
	private Timestamp regdate;
}
