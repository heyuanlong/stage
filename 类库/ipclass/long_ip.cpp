bool long_ip::ipv4_i64tostr(type_long_i64 ipint,std::string *str)
{
	long a, b, c, d;
	a = ipint / pow(2, 24);
	ipint = ipint % (type_long_i64)pow(2, 24);

	b = ipint / pow(2, 16);
	ipint = ipint % (type_long_i64)pow(2, 16);

	c = ipint / pow(2, 8);
	ipint = ipint % (type_long_i64)pow(2, 8);

	d = ipint / pow(2, 0);

char dec[16]={0};
#if (defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__))
	sprintf_s(dec, 65, "%d.%d.%d.%d", a, b, c, d);
#elif defined(__linux__) || defined(__linux)
	sprintf(dec, "%d.%d.%d.%d", a, b, c, d);
#endif

	*str = dec;
	return true;
}
bool long_ip::ipv4_strtoi64(const char *str,type_long_i64 *ipint)
{
	long a, b, c, d;
	int len = strlen(str);
	if (len == 0)
	{
		fprintf(errstr,"ip string is invalid");
		return false;
	}
	for (int i = 0; i < len; ++i)
		if (ipstr[i] == '.')
			ipstr[i] = ' ';

#if (defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__))
	sscanf_s(str, "%d %d %d %d", &a, &b, &c, &d);
#elif defined(__linux__) || defined(__linux)
	sscanf(str, "%d %d %d %d", &a, &b, &c, &d);
#endif

	type_long_i64 z = 0;
	z += a * pow(2, 24);
	z += b * pow(2, 16);
	z += c * pow(2, 8);
	z += d * pow(2, 0);
	*ipint = z;

	return true;
}

bool long_ip::ipv4_hosttostr(const char *host,std::string *str)
{

}
bool long_ip::ipv4_hosttoi64(const char *host,type_long_i64 *ipint)
{

}
