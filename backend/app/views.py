from django.http import JsonResponse
from .models import Notice
from .utils import get_notices_from_skk_website

def notice_list(request):

    url_pattern = 'https://www.skku.edu/skku/campus/skk_comm/notice01.do?mode=list&&articleLimit=10&article.offset={0}'
    notices = get_notices_from_skk_website(url_pattern, max_pages=10)

    # 크롤링된 공지사항을 JSON 응답으로 반환
    if notices:
        return JsonResponse({'notices': notices}, safe=False)
    else:
        return JsonResponse({'error': '공지사항을 가져오지 못했습니다.'}, status=500)
