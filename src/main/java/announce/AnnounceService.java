package announce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnnounceService {
	
	@Autowired
	AnnounceDao ad;
	public int announceInsert2(AnnounceVo av) {
		return ad.announceInsert2(av);
	}
}