from copy import copy


def orm_to_json(orm):
    if not orm:
        return None
    if isinstance(orm, list):
        ret = []
        for o in orm:
            if hasattr(o, '__dict__'):
                d = copy(o.__dict__)
            else:
                d = o._asdict()
            d.pop('_sa_instance_state', None)
            ret.append(d)
        return ret
    else:
        if hasattr(orm, '__dict__'):
            d = copy(orm.__dict__)
        else:
            d = orm._asdict()
        d.pop('_sa_instance_state', None)
        return d
